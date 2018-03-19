class Contact < ActiveRecord::Base
	has_and_belongs_to_many :groups, dependent: :destroy
	before_save :capitalize_names
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :phone_number, presence: true
	validates :street_name, presence: true
	validates :street_number, presence: true
	validates :zipcode, presence: true
	validates :city, presence: true
	validates :country, presence: true
	validates :phone_number, :length => { :minimum => 10,
    :too_short => "%{count} is het minimum aantal tekens" }
	def capitalize_names
		self.first_name.capitalize!
		self.middle_name.downcase!
		self.last_name.capitalize!
	end
end
