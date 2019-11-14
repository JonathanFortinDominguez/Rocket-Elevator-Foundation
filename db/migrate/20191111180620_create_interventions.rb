class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.references :author, foreign_key: {to_table:'employees'} 
      t.references :customer, foreign_key: true, null: false
      t.references :building, foreign_key: true, null: false
      t.references :battery, foreign_key: true
      t.references :column, foreign_key: true
      t.references :elevator, foreign_key: true
      t.references :employee, foreign_key: {to_table:'employees'}, null: true
      t.datetime :intervention_datetime_start
      t.datetime :intervention_datetime_end
      t.string :result, default: 'Incomplete'
      t.text :report
      t.string :status, default: 'Pending'
      t.timestamps
    end
  end
end
