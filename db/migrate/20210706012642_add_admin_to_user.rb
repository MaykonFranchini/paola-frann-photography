class AddAdminToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :boolean
    change_column_default :users, :admin, false
  end
end
