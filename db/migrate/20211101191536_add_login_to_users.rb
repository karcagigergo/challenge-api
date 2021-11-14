class AddLoginToUsers < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :login, :json
  end
    
  def down
    remove_column :users, :login, :json
  end
end
