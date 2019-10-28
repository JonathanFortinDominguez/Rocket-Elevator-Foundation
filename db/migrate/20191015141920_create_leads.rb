class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :fullname
      t.string :businessName
      t.string :email
      t.string :phoneNumber
      t.string :projectName
      t.string :projectDescription
      t.string :departement
      t.string :message
      t.datetime :follow_up_date
      t.timestamps
    end
  end
end
