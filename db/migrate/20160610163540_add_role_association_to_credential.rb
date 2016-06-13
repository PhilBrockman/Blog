class AddRoleAssociationToCredential < ActiveRecord::Migration
  def change
    add_reference :credentials, :role, index: true, foreign_key: true
  end
end
