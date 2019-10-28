class CreateFactcontact < ActiveRecord::Migration[5.2]
  def change
    create_table :factcontacts do |t|
      t.integer :contactid
      t.string :business_name
      t.string :email
      t.string :project_name
      t.timestamp :creation_date
    end
  end
end
