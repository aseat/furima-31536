class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string  :post_number,   null: false
      t.integer :prefecture_id, null:false
      t.string  :municipality, null:false
      t.string  :addresses, null:false
      t.string  :build_name
      t.string  :phone_number, null:false
      t.references :purchase_id, null:false, foreign_key: true
      t.timestamps
    end
  end
end
