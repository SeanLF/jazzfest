class VolunteerOpportunity < ApplicationRecord
  has_many :accepted_applications, foreign_key: :accepted_volunteer_opportunity_id, class_name: 'OpportunityApplication'

  def title=(val)
    self[:title] = val.strip
  end

  def self.visible
    where(visible: true)
  end

  def self.applied_to_
    applied_to(OpportunityApplication.all)
  end

  def self.applied_to(opportunity_application_policy_scoped)
    where(id: opportunity_application_policy_scoped.pluck(:choices).reject(&:nil?).map { |choices| JSON.parse(choices) }.flatten)
  end

  def self.visible_or_applied_to(opportunity_application_policy_scoped)
    visible.or(applied_to(opportunity_application_policy_scoped))
  end
end
