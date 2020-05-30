class ChangeColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :gender,:integer, null: true
  end
end
