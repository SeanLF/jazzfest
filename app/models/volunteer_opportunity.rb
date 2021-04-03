class VolunteerOpportunity < ApplicationRecord
  has_many :accepted_applications, foreign_key: :accepted_volunteer_opportunity_id, class_name: 'OpportunityApplication'

  def title=(val)
    self[:title] = val.strip
  end

  class << self
    def visible
      where(visible: true)
    end

    def applied_to_
      applied_to(OpportunityApplication.all)
    end

    def applied_to(scope)
      return none if scope.empty?

      where(id: OpportunityApplication.uniq_choice_ids(scope: scope))
    end

    def visible_or_applied_to(scope)
      visible
        .or(applied_to(scope))
    end
  end
end
