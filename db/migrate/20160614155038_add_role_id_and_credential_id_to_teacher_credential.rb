class AddRoleIdAndCredentialIdToTeacherCredential < ActiveRecord::Migration
  def change
  	add_column :teacher_credentials, :role_id, :integer
  	add_column :teacher_credentials, :credential_id, :integer
  end
end
