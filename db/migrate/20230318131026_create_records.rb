class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.datetime :clock_in
      t.datetime :clock_out
      t.string :remarks
      t.string :time_zone, default: "UTC"

      t.timestamps
    end

    add_index :records, [ :user_id, :remarks ]
  end
end
