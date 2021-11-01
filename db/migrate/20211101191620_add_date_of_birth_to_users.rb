class AddDateOfBirthToUsers < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :dob, :json
    change_column_null :users, :dob, false
  end
    
  def down
    remove_column :users, :dob, :json
  end
end
