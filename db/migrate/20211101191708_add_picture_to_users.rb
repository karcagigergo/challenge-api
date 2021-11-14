class AddPictureToUsers < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :picture, :json
  end
    
  def down
    remove_column :users, :picture, :json
  end
end
