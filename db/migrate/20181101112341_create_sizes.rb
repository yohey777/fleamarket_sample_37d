class CreateSizes < ActiveRecord::Migration[5.1]
  def change
    create_table :sizes do |t|
      t.string :name
      t.integer :S_category_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
