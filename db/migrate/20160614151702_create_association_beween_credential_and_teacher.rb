class CreateAssociationBeweenCredentialAndTeacher < ActiveRecord::Migration
  def change
    create_table :credentials_teachers, id: false do |t|
      t.belongs_to :credential, index: true
      t.belongs_to :teacher, index: true
    end
  end
end
