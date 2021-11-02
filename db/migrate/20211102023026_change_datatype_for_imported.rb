class ChangeDatatypeForImported < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :imported_t, :datetime
  end
end
