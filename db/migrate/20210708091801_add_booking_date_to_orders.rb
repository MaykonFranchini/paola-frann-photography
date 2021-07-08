class AddBookingDateToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :booking_date, :string
  end
end
