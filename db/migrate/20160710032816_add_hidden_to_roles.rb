class AddHiddenToRoles < ActiveRecord::Migration
  def change
  	add_column :roles, :hidden, :boolean
  end
end
