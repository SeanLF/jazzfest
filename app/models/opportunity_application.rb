class OpportunityApplication < ApplicationRecord
  belongs_to :profile

  validate :min_dates_in_range
  validate :choice_in_range

  def min_dates_in_range
    return if availability.nil?
    active_event = Event.all.active

    errors.add(:availability, 'You must select at least four valid dates') unless availability.split(',').reject(&:empty?).select { |str_date| Date.parse(str_date).between?(active_event.start_date, active_event.end_date) }.count >= 4
  end

  def choice_in_range
    return unless submitted
    num_choices = choices.empty? ? 0 : JSON.parse(choices).length
    errors.add(:choices, 'You must select between one and four choices') unless num_choices.between?(1, 4)
  end
end
