class ChangeColumnDefaultDuration < ActiveRecord::Migration[7.0]
  def change
    change_column_default :records, :duration, 0
    Record.where(duration: nil).update_all(duration: 0)
  end
end
