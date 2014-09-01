class Day < ActiveRecord::Base
	belongs_to :baby
	has_many :events
end
