class AddRegInfoToUsers < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :registered, :json
  end
    
  def down
    remove_column :users, :registered, :json
  end
end
