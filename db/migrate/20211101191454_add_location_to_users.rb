class AddLocationToUsers < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :location, :json
    change_column_null :users, :location, false
  end
    
  def down
    remove_column :users, :location, :json
  end
end
