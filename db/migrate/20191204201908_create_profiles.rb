class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :language
      t.string :profile_id
      t.string :name
      t.boolean :enrolled
      t.timestamps
    end
  end
end
