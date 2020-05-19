class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name,              null: false
      t.text    :description,       null: false
      t.integer :price,             null: false
      t.integer :size_id                       
      t.integer :category_id,       null: false
      t.string  :brand
      t.integer :condition_id,      null: false
      t.boolean :shipping_fee_side, null: false
      t.integer :shipping_days_id,  null: false
      t.integer :prefectures_id,    null: false
      t.references :user,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
