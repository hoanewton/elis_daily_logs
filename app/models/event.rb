class Event < ActiveRecord::Base
  belongs_to :day
  belongs_to :user

  def self.event_types
  	["Nap", "Meal", "Diaper"]
  end
end
