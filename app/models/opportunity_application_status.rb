class OpportunityApplicationStatus < ApplicationRecord
  has_many :opportunity_applications

  def self.pending
    find_by(name: 'Pending')
  end

  def self.accepted
    find_by(name: 'Accepted')
  end

  def self.denied
    find_by(name: 'Denied')
  end
end
