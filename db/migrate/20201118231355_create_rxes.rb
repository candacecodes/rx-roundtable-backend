class CreateRxes < ActiveRecord::Migration[6.0]
  def change
    create_table :rxes do |t|
      t.string :name

      t.timestamps
    end
  end
end
