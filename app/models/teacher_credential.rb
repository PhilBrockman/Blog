class TeacherCredential < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :credential

	def self.find_by_teacher_credential(teacher_id, credential_id)
		return RoleCredential.where(:teacher_id => role_id, :credential_id => credential_id)
	end
end
