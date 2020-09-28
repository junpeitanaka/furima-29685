class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.integer :item_name,         null: false
      t.text    :user_id,           null: false, foreign_key:true
      t.integer :explanation,       null: false
      t.integer :category_id,       null: false
      t.integer :state_id,          null: false
      t.integer :fee_deliveru_id,   null: false
      t.integer :area_delivery_id,  null: false
      t.integer :day_delivery_id,   null: false
      t.integer :price,             null: false
      t.timestamps 
    end
  end
end


