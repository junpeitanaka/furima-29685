class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer  :order_id,                null: false, foreing_key:true
      t.string   :post_number,             null: false 
      t.integer  :prefecture_id,           null: false
      t.string   :city,                    null: false
      t.string   :block,                   null: false
      t.string   :building
      t.string   :tele_number                
      t.timestamps
    end
  end
end

