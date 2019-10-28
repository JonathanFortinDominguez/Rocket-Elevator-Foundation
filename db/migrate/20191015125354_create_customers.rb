class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.references :address, foreign_key: true
      t.references :user, foreign_key: true
      t.date :creation_date
      t.string :business_name
      t.string :full_name
      t.string :phone_number
      t.string :email
      t.text :business_desc
      t.string :fullname_service_person
      t.string :phone_service_person
      t.string :email_service_person

      t.timestamps
    end
  end
end
