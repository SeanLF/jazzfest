# frozen_string_literal: true

class OpportunityApplicationsController < ApplicationController
  before_action :set_opportunity_application, only: [:show, :edit, :update, :destroy, :review]
  before_action :authenticate_user!
  before_action(except: [:index, :new, :create]) { @opportunity_application.user = session[:userinfo] }
  before_action(only: [:update, :edit]) { authorize @opportunity_application }
  before_action(except: [:update, :edit]) { authorize OpportunityApplication }

  # GET /opportunity_applications
  # GET /opportunity_applications.json
  def index
    @opportunity_applications = policy_scope(OpportunityApplication).submitted.order(created_at: :desc).eager_load(:profile, :opportunity_application_status)
  end

  # GET /opportunity_applications/1
  # GET /opportunity_applications/1.json
  def show; end

  # GET /opportunity_applications/new
  def new
    @opportunity_application = OpportunityApplication.new
    @opportunity_application.user = session[:userinfo]
  end

  # GET /opportunity_applications/1/edit
  def edit; end

  # POST /opportunity_applications
  # POST /opportunity_applications.json
  def create
    @opportunity_application = OpportunityApplication.new(opportunity_application_params)
    @opportunity_application.user = session[:userinfo]

    respond_to do |format|
      if @opportunity_application.save
        format.html { redirect_to(@opportunity_application, notice: "Opportunity application was successfully created.") }
        format.json { render(:show, status: :created, location: @opportunity_application) }
      else
        format.html { render(:new) }
        format.json { render(json: @opportunity_application.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /opportunity_applications/1
  # PATCH/PUT /opportunity_applications/1.json
  def update
    respond_to do |format|
      if @opportunity_application.update(opportunity_application_params)
        format.html { redirect_to(@opportunity_application, notice: "Opportunity application was successfully updated.") }
        format.json { render(:show, status: :ok, location: @opportunity_application) }
      else
        format.html { render(:edit) }
        format.json { render(json: @opportunity_application.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /opportunity_applications/1
  # DELETE /opportunity_applications/1.json
  def destroy
    @opportunity_application.destroy
    respond_to do |format|
      format.html { redirect_to(opportunity_applications_url, notice: "Opportunity application was successfully destroyed.") }
      format.json { head(:no_content) }
    end
  end

  def review
    temp = {}
    VolunteerOpportunity.select(:id, :title).each { |opportunity| temp[opportunity.id] = opportunity.title }
    @volunteer_opportunities = temp.to_json
    temp = {}
    OpportunityApplicationStatus.all.each { |status| temp[status.id] = { name: status.name, action_name: status.action_name, action_color: status.action_color } }
    @opportunity_application_statuses = temp.to_json
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_opportunity_application
    @opportunity_application = OpportunityApplication.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the allowlist through.
  def opportunity_application_params
    params.require(:opportunity_application).permit(policy(@opportunity_application).permitted_attributes)
  end
end
