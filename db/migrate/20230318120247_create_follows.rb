class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :followed_user_id, null: false

      t.timestamps
    end

    add_index :follows, [:user_id, :followed_user_id], unique: true
    add_foreign_key :follows, :users, column: :followed_user_id
  end
end
