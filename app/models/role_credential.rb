class RoleCredential < ActiveRecord::Base
	belongs_to :role
	belongs_to :credential
end
