class Event < ApplicationRecord
  def self.active
    where(active: true).first
  end
end
