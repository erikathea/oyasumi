class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :uuid, null: false, index: { unique: true }
      t.string :username, null: false, index: { unique: true }
      t.string :first_name, null: false
      t.string :last_name
      t.string :time_zone, default: "UTC"

      t.timestamps
    end
  end
end
