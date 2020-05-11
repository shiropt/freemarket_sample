class CreatePurchasedInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :purchased_infos do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.date :purchase_date, null: false
      t.integer :shipping_fee, null: false
      t.timestamps
    end
  end
end
