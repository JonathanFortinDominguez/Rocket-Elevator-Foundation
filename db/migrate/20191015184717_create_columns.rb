class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.references :battery, foreign_key: true
      t.string :type_of_building
      t.integer :number_of_floor
      t.string :status
      t.string :information
      t.text :notes

      t.timestamps
    end
  end
end
