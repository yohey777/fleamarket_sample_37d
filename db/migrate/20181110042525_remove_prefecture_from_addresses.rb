class RemovePrefectureFromAddresses < ActiveRecord::Migration[5.1]
  def change
    remove_column :addresses, :prefecture, :string
  end
end
