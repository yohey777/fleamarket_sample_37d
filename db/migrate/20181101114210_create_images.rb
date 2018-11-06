class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :image_url
      t.integer :item_id, foreign_key: true
      t.timestamps
    end
  end
end
