class CreateMCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :m_categories do |t|
      t.string :name
      t.integer :L_category_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
