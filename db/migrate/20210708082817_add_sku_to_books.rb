class AddSkuToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :sku, :string
  end
end
