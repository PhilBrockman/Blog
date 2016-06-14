class DropTeacherCredential < ActiveRecord::Migration
  def change
  	drop_table :teacher_credentials
  end
end
