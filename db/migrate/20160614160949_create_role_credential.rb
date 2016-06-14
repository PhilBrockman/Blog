class CreateRoleCredential < ActiveRecord::Migration
  def change
    create_table :role_credentials do |t|
      t.belongs_to :credential, index: true
      t.belongs_to :role, index: true
    end
  end
end
