# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :store_opportunity_id_if_not_authorized_yet, only: [:apply]
  before_action :set_active_event, only: [:apply]
  before_action :ensure_within_registration_range!, only: [:apply]
  before_action :authenticate_user!

  def apply
    authorize(:dashboard)
    @min_dates = Setting.min_dates.real_value
    @min_num_choices = Setting.min_num_choices.real_value
    @max_num_choices = Setting.max_num_choices.real_value
    @profile = Profile.find_by(auth0_id: session[:userinfo]["uid"])
    authorize(@profile, :update?)
    @opportunity_application = OpportunityApplication.find_or_initialize_by(profile: @profile)
    if session[:volunteer_opportunity_id] && (@opportunity_application.choices.nil? || @opportunity_application.choices.blank?)
      @opportunity_application.choices = session[:volunteer_opportunity_id]
    end
    if @opportunity_application.new_record?
      @opportunity_application.opportunity_application_status_id = OpportunityApplicationStatus.pending.id
    end
    @opportunity_application.save(validate: false)
    authorize(@opportunity_application, :update?)
    @volunteer_opportunities = policy_scope(VolunteerOpportunity).order(:title)
    authorize(@volunteer_opportunities, :index?)
  end

  def success
    authorize(:dashboard)
    profile = Profile.find_by(auth0_id: session[:userinfo]["uid"])
    unless OpportunityApplication.find_by(profile: profile).submitted
      redirect_to(apply_path, notice: "Opportunity application was successfully created.")
    end

    @update = params["update"] == "true" || false
  end

  def elevated_user_dashboard
    authorize(:dashboard)
  end

  private

  def set_active_event
    @active_event = policy_scope(Event).first_active
  end

  def ensure_within_registration_range!
    return if @active_event.present? && Time.now.between?(@active_event.registration_start_date, @active_event.registration_end_date)

    redirect_back(fallback_location: root_path, notice: "You can not apply at this time.")
  end

  def store_opportunity_id_if_not_authorized_yet
    session[:volunteer_opportunity_id] = nil
    if params["volunteer_opportunity_id"].present?
      session[:volunteer_opportunity_id] = [params["volunteer_opportunity_id"]].to_json
    end
  end
end
