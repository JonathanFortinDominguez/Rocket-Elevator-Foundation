class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.references :building, foreign_key: true
      t.string :type_of_building
      t.string :status
      t.references :employee, foreign_key: true
      t.date :operational_date
      t.date :last_checkup
      t.string :certificat
      t.string :info
      t.text :notes

      t.timestamps
    end
  end
end
