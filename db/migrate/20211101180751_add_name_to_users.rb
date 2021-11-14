class AddNameToUsers < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :name, :json
  end
   
  def down
    remove_column :users, :name, :json
  end
end
