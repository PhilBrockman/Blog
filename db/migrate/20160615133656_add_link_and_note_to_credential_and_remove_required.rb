class AddLinkAndNoteToCredentialAndRemoveRequired < ActiveRecord::Migration
  def change
  	remove_column :credentials, :required, :boolean
  	add_column :credentials, :note, :text
  	add_column :credentials, :link, :string
  end
end
