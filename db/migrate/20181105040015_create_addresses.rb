class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string    :first_name,null: false
      t.string    :last_name,null: false
      t.string    :first_name_kana,null: false
      t.string    :last_name_kana,null: false
      t.string    :postal_code,null: false
      t.string    :prefecture,null: false
      t.string    :city,null: false
      t.string    :street_number,null: false
      t.string    :building_name
      t.string    :telephone_number
      t.integer   :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
