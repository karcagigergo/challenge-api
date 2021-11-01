class AddLoginToUsers < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :login, :json
    change_column_null :users, :login, false
  end
    
  def down
    remove_column :users, :login, :json
  end
end
