class AddNationalityToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :nat, :string
  end
end
