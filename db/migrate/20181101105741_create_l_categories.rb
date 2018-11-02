class CreateLCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :l_categories do |t|
      t.string :name
      t.timestamps
    end
  end
end
