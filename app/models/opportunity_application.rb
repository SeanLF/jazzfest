class OpportunityApplication < ApplicationRecord
  belongs_to :profile

  validate :at_least_x_dates
  validate :choice_in_range

  def at_least_x_dates
    return if availability.nil?
    errors.add(:availability, 'You must select at least four dates') unless availability.split(',').reject(&:blank?).count >= 4
  end

  def choice_in_range
    return unless submitted
    num_choices = choices.empty? ? 0 : JSON.parse(choices).length
    errors.add(:choices, 'You must select between one and four choices') unless 1 <= num_choices && num_choices <= 4
  end
end
