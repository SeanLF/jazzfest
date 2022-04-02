# frozen_string_literal: true

class OpportunityApplication < ApplicationRecord
  has_paper_trail
  attr_accessor :user

  belongs_to :profile
  belongs_to :opportunity_application_status
  belongs_to :accepted_volunteer_opportunity, foreign_key: :accepted_volunteer_opportunity_id, optional: true, inverse_of: :accepted_applications, class_name: "VolunteerOpportunity"

  validate :min_dates_in_range
  validate :choice_in_range

  class << self
    def submitted
      where(submitted: true)
    end

    def uniq_choice_ids(scope: all)
      scope
        .pluck(:choices)
        .reject(&:nil?)
        .map { JSON.parse(_1) }
        .flatten
        .uniq
        .compact
    end
  end

  def min_dates_in_range
    return if availability.nil?

    min_dates = Setting.min_dates.real_value

    return if dates_available.count { date_in_range?(_1) } >= min_dates

    errors.add(:availability, "You must select more dates")
  end

  def choice_in_range
    return unless submitted

    choices_ = choices.blank? ? [] : JSON.parse(choices).map(&:to_i)
    valid_volunteer_opportunity_ids = Pundit.policy_scope(user, VolunteerOpportunity).pluck(:id)
    unless (choices_ | valid_volunteer_opportunity_ids).sort == valid_volunteer_opportunity_ids.sort
      errors.add(:choices, "Invalid choice")
    end

    min_num_choices = Setting.min_num_choices.real_value
    max_num_choices = Setting.max_num_choices.real_value
    unless choices_.length.between?(min_num_choices, max_num_choices)
      errors.add(:choices, "You must select more choices")
    end
  end

  def dates_available
    availability.split(",").reject(&:blank?).map { Date.parse(_1) }
  end

  def date_in_range?(date)
    return false if (active_event = Event.active.first).nil?

    date.between?(active_event.start_date, active_event.end_date)
  end

  def active_event
    @active_event ||= policy_scope(Event).first_active
  end
end
