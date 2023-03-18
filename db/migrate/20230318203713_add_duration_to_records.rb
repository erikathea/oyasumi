class AddDurationToRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :records, :duration, :integer
  end
end
