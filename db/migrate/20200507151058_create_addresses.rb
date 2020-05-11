class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :post_code,           null: false
      t.integer :prefecture_id,       null: false, foreign_key: true
      t.string :city,                 null: false
      t.string :block,                null: false
      t.string :building
      t.integer :telephone_number
      t.integer :user_id,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
