class AddLocationToUsers < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :location, :json
  end
    
  def down
    remove_column :users, :location, :json
  end
end
