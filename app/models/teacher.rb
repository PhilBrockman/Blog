class Teacher < ActiveRecord::Base
	has_many :teacher_credentials
	has_many :credentials, :through => :teacher_credentials

	validates :name, presence: true
	validates :email, presence: true
	
	def self.partial_search(search)
		where("name ILIKE ? OR email ILIKE ?", "%#{search}%", "%#{search}%")
	end
end
