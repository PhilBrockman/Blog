class Teacher < ActiveRecord::Base
	has_many :teacher_credentials
	has_many :credentials, :through => :teacher_credentials

	def self.search(search)
		s = search.upcase
		where("upper(name) LIKE ? OR upper(email) LIKE ?", "%#{s}%", "%#{s}%")
	end
end
