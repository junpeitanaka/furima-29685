class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nickname, null: false
      t.string :mail,     null: false
      t.string :password, null:false
      t.string :last_name, null:false
      t.string :first_name, null:false
      t.string :last_name_kana, null:false
      t.string :first_name_kana, null:false
      t.date :bitthday, null: false
    end
  end
end
