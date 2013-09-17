class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.string :user_id
      t.string :number
      t.string :state

      t.timestamps
    end
  end
end
