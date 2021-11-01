class AddPictureToUsers < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :picture, :json
    change_column_null :users, :picture, false
  end
    
  def down
    remove_column :users, :picture, :json
  end
end
