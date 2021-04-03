class Event < ApplicationRecord
  def self.active
    where(active: true)
  end
end
