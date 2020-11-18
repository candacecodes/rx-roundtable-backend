class CreateSelectedrxes < ActiveRecord::Migration[6.0]
  def change
    create_table :selectedrxes do |t|
      t.integer :user_id
      t.integer :rx_id

      t.timestamps
    end
  end
end
