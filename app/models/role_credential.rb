class RoleCredential < ActiveRecord::Base
	belongs_to :role
	belongs_to :credential

	def self.find_by_role_credential(role_id, credential_id)
		return RoleCredential.where(:role_id => role_id, :credential_id => credential_id)
	end
end
