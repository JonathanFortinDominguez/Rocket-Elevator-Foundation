class CreateFactquotes < ActiveRecord::Migration[5.2]
  def change
    create_table :factquotes do |t|
      t.integer :quoteid
      t.string :business_name
      t.string :email
      t.integer :nbelevator
      t.timestamp :creation_date
    end
  end
end
