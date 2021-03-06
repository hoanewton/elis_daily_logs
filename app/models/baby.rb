class Baby < ActiveRecord::Base

	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  has_and_belongs_to_many :users
  has_many :days

  validates :age, numericality: true
	validates :first_name, presence: true
	validates :last_name, presence: true
end