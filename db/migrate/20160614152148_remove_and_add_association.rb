class RemoveAndAddAssociation < ActiveRecord::Migration
  def change
  	drop_table :credentials_teachers

    create_table :credentials_roles, id: false do |t|
      t.belongs_to :credential, index: true
      t.belongs_to :role, index: true
    end
  end
end
