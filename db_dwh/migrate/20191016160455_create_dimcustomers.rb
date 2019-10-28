class CreateDimcustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :dimcustomers do |t|
      t.string :business_name
      t.string :contact_full_name
      t.string :contact_email
      t.integer :nbelevator
      t.string :client_city
      t.timestamp :creation_date
    end
  end
end
