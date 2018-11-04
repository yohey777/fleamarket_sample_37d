class CreateSCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :s_categories do |t|
      t.string :name
      t.integer :M_category_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
