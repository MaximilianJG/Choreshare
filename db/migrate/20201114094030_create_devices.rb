class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.string :type
      t.string :location
      t.integer :price
      t.string :description

      t.timestamps
    end
  end
end
