class AddExamToCredential < ActiveRecord::Migration
  def change
  	add_column :credentials, :exam, :boolean
  end
end
