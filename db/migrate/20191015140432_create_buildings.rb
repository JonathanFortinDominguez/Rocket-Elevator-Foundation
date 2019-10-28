class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.references :customer, foreign_key: true
      t.references :address, foreign_key: true
      t.string :fullName_building_administrator
      t.string :email_building_administrator
      t.string :phone_administrator
      t.string :fullName_service_contact
      t.string :email_service_contact
      t.string :phone_service_contact

      t.timestamps
    end
  end
end
