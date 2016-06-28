class Teacher < ActiveRecord::Base
	has_many :teacher_credentials
	has_many :credentials, :through => :teacher_credentials

	validates :name, presence: true
	validates :email, presence: true
	
	def self.search(search)
		s = search.upcase
		where("upper(name) LIKE ? OR upper(email) LIKE ?", "%#{s}%", "%#{s}%")
	end
end
