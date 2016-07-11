class AddSpecialEducationToRole < ActiveRecord::Migration
  def change
  	add_column :roles, :special_education, :boolean
  end
end
