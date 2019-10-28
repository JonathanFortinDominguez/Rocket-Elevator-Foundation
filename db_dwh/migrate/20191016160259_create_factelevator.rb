class CreateFactelevator < ActiveRecord::Migration[5.2]
  def change
    create_table :factelevators do |t|
      t.integer :elevatorid
      t.string :serial_number
      t.integer :buildingid
      t.integer :customer
      t.string :building_city
      t.timestamp :deploy_date

    end
  end
end
