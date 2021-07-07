class AddBookDateToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :booking_date, :date
  end
end
