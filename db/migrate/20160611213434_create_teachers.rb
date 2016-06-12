class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.references :role, index: true, foreign_key: true
      t.string :grade_level
      t.boolean :special_education
      t.boolean :PA
      t.boolean :US
      t.references :certificate, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
