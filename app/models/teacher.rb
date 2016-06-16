class Teacher < ActiveRecord::Base
	has_one :role
	has_many :teacher_credentials
	has_many :credentials, :through => :teacher_credentials
end
