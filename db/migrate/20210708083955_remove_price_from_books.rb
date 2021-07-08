class RemovePriceFromBooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :price, :integer
  end
end
