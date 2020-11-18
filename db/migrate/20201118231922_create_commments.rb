class CreateCommments < ActiveRecord::Migration[6.0]
  def change
    create_table :commments do |t|
      t.int :user_id
      t.int :rx_id

      t.timestamps
    end
  end
end
