class CreateEmployeesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.index  :id
      t.string :lastname
      t.string :name
      t.string :function
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
    end
  end
end
