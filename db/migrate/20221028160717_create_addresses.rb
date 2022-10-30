class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.timestamps
      t.references :order,            null:false,foreign_key: true
      t.string :post_code,           null: false
      t.integer :prefecture_id,      null: false
      t.string :municipalities,      null: false
      t.string :building_name       
      t.string :phone_number,        null: false
      t.string :address,             null: false
    end
  end
end
