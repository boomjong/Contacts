class Group < ActiveRecord::Base
	has_and_belongs_to_many :contacts, dependent: :destroy
	validates :group_name, presence: true
end
