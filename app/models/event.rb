class Event < ActiveRecord::Base
  belongs_to :day
  belongs_to :user

  validates :start_time, :end_time, presence: true

  def self.event_types
  	["Nap", "Meal", "Diaper", "Activity", "Other"]
  end

  def css_class
  	case description
  		when 'Nap'
  			'warning'
  		when 'Diaper'
  			'success'
  		when 'Activity'
  			'info'
  		when 'Meal'
  			'danger'
		  else
		  	'active' 
		end
  end
end
