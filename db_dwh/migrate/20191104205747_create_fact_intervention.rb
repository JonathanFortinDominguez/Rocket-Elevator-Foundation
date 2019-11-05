class CreateFactIntervention < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_interventions do |t|
    t.integer :employeeid
    t.integer :buildingid
    t.integer :batteryid,   null: true
    t.integer :columnid,    null: true
    t.integer :elevatorid,  null: true
    t.datetime :intervention_datetime_start
    t.datetime :intervention_datetime_end, null: true
    t.string :result
    t.string :report, null: true
    t.string :status 
    end
  end
end
