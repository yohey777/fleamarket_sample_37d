class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name, null: false, index: true
      t.integer :price, null: false
      t.text :description, null: false
      t.integer :status, null: false
      t.integer :prefecture, null: false
      t.integer :expense, null: false
      t.integer :shipping_method, null: false
      t.integer :arrival_date, null: false
      t.integer :like_count, null: false
      t.integer :L_category_id, null: false, foreign_key: true
      t.integer :M_category_id, null: false, foreign_key: true
      t.integer :S_category_id, null: false, foreign_key: true
      t.integer :size_id, null: false, foreign_key: true
      t.integer :brand_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
