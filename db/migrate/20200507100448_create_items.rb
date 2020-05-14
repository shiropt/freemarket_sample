class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name, null: false
      t.string  :size
      t.string  :condition, null: false
      t.text  :description, null: false
      t.boolean  :shipping_fee_side, null: false
      t.integer  :price, null: false
      t.integer  :shipping_days
      t.integer  :user_id, null: false, null: false
      t.integer  :brand_id, null: false, null: false
      t.integer  :category_id, null: false, null: false
      t.integer  :prefectures_id, null: false, null: false
      t.integer :purchased_info_id, foreign_key: true
      t.timestamps
    end
  end
end
