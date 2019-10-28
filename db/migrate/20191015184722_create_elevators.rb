class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.references :column, foreign_key: true
      t.string :serial_number
      t.string :model
      t.string :type_of_building
      t.string :status
      t.date :activate_date
      t.date :last_checkup
      t.string :inspection_certificat
      t.string :information
      t.string :notes

      t.timestamps
    end
  end
end
