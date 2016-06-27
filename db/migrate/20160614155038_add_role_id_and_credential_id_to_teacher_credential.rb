class AddRoleIdAndCredentialIdToTeacherCredential < ActiveRecord::Migration
  def change
  	create_table :teacher_credentials
  	add_column :teacher_credentials, :role_id, :integer
  	add_column :teacher_credentials, :credential_id, :integer
  end
end
