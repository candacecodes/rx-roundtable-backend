class AddNoteToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :note, :string
  end
end
