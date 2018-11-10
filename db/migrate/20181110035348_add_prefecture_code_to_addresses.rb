class AddPrefectureCodeToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :prefecture_code, :integer
  end

   def up
    add_column :addresses, :prefecture_code, :integer
    change_column :addresses, :prefecture_code, :integer, :null => false
  end

  def down
    remove_column :addresses, :prefecture_code
  end
end
