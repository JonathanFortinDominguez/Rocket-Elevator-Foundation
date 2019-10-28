class CreateQuotesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :Full_Name
      t.string :Address
      t.string :Business_Name
      t.string :Project_Name
      t.string :Email_Address
      t.string :Phone_Number
      t.string :buildingType
      t.string :quality
      t.string :numberElevators
      t.decimal :installationPrice
      t.decimal :totalPrice
      t.integer :numberApp
      t.integer :numberBuisiness
      t.integer :numberFloor
      t.integer :numberBasement
      t.integer :numberParking
      t.integer :numberShaft
      t.integer :numberTenant
      t.integer :maximumPerFloor
      t.timestamps
    end
  end


end
