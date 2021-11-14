class AddDateOfBirthToUsers < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :dob, :json
  end
    
  def down
    remove_column :users, :dob, :json
  end
end
