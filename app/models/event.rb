class Event < ActiveRecord::Base
  belongs_to :day

  def self.event_types
  	["Nap", "Meal", "Diaper"]
  end
end
