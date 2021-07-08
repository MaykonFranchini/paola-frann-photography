class OrdersController < ApplicationController
        
    def create
        book = Book.find(params[:book_id])
        order = Order.new(order_params)
        order.book_sku = book.sku
        order.amount = book.price
        order.state = 'pending'
        order.book = book
        order.user = current_user

        if order.save
            session = Stripe::Checkout::Session.create(
                payment_method_types: ['card'],
                line_items: [{
                name: book.sku,
                amount: book.price_cents,
                currency: 'gbp',
                quantity: 1
                }],
                success_url: order_url(order),
                cancel_url: order_url(order)
            )

            order.update(checkout_session_id: session.id)
            redirect_to new_order_payment_path(order)
        else
            redirect_to root_path , flash: { notice: 'Sorry! Something went wrong. Fill all fields and try again.'}
        end
    end

    def show
        @order = current_user.orders.find(params[:id])
      end
    # def checkout
    #     @orders = Order.where(user_id: current_user, status: "pending")
    #     @order = @orders.last
    # end

    private

    def order_params
        params.require(:order).permit(:booking_date)
    end
end
