class Day < ActiveRecord::Base
	belongs_to :user
	belongs_to :baby
	has_many :events

	# def self.search(search)
	#   search_condition = "%" + search + "%"
	#   find(:all, :conditions => ['date LIKE ?', search_condition, search_condition])
	# end

end
