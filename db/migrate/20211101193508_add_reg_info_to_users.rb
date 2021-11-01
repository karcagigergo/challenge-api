class AddRegInfoToUsers < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :registered, :json
    change_column_null :users, :registered, false
  end
    
  def down
    remove_column :users, :registered, :json
  end
end
