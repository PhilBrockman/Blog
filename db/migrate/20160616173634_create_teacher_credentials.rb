class CreateTeacherCredentials < ActiveRecord::Migration
  def change
    create_table :teacher_credentials do |t|
      t.references :teacher, index: true, foreign_key: true
      t.references :credential, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
