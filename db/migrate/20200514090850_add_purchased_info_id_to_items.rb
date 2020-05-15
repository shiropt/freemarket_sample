class AddPurchasedInfoIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :purchased_info_id, :integer, foreign_key: true
  end
end
