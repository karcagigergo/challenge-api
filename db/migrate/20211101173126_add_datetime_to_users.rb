class AddDatetimeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :imported_t, :date
  end
end
