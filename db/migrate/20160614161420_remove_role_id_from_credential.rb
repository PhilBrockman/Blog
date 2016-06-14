class RemoveRoleIdFromCredential < ActiveRecord::Migration
  def change
  	remove_column :credentials, :role_id, :integer
  end
end
