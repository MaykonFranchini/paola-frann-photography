class ChangeAdressToStudio < ActiveRecord::Migration[6.0]
  def change
    rename_column(:studios, :adress, :address)
  end
end
