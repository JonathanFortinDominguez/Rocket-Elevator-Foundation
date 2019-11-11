class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.integer :author, null: false
      t.references :customer, foreign_key: true, null: false
      t.references :building, foreign_key: true, null: false
      t.references :battery, foreign_key: true, null: true
      t.references :column, foreign_key: true, null: true
      t.references :elevator, foreign_key: true, null: true
      t.references :employee, foreign_key: true, null: true
      t.datetime :intervention_datetime_start, null: true
      t.datetime :intervention_datetime_end, null: true
      t.string :result, default: 'Incomplete'
      t.text :report, null: false
      t.string :status , default: 'Pending'
      t.timestamps
    end
  end
end
