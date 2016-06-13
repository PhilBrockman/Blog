class RemovePaFromTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :certificate_status, :string
    add_column :teachers, :certificate_location, :string
    remove_column :teachers, :PA, :boolean
    remove_column :teachers, :US, :boolean
  end
end
