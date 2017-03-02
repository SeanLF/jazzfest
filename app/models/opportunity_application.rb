class OpportunityApplication < ApplicationRecord
  has_paper_trail
  attr_accessor :user
  belongs_to :profile
  belongs_to :opportunity_application_status
  belongs_to :accepted_volunteer_opportunity, foreign_key: :accepted_volunteer_opportunity_id, optional: true, inverse_of: :accepted_applications, class_name: VolunteerOpportunity

  validate :min_dates_in_range
  validate :choice_in_range

  def self.submitted
    where(submitted: true)
  end

  def min_dates_in_range
    return if availability.nil?
    active_event = Event.all.active
    min_dates = Setting.min_dates.real_value

    errors.add(:availability, 'You must select more dates') unless availability.split(',').reject(&:empty?).select { |str_date| Date.parse(str_date).between?(active_event.start_date, active_event.end_date) }.count >= min_dates
  end

  def choice_in_range
    return unless submitted
    _choices = choices.nil? || choices.empty? ? [] : JSON.parse(choices).map(&:to_i)
    valid_volunteer_opportunity_ids = Pundit.policy_scope(user, VolunteerOpportunity).pluck(:id)
    errors.add(:choices, 'Invalid choice') unless (_choices | valid_volunteer_opportunity_ids).sort == valid_volunteer_opportunity_ids.sort
    min_num_choices = Setting.min_num_choices.real_value
    max_num_choices = Setting.max_num_choices.real_value
    errors.add(:choices, 'You must select more choices') unless _choices.length.between?(min_num_choices, max_num_choices)
  end
end
