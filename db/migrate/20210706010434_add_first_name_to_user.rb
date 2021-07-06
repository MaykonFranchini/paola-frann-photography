class AddFirstNameToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :text
  end
end
