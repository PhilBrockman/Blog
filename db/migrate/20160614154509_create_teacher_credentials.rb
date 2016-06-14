class CreateTeacherCredentials < ActiveRecord::Migration
  def change
    create_table :teacher_credentials do |t|

      t.timestamps null: false
    end
  end
end
