class Event < ApplicationRecord
  class << self
    def active
      where(active: true)
    end

    def first_active
      active.first
    end
  end
end
