class OrdersController < ApplicationController
        
    def create
        @book = params[:book_id]
        @order = Order.new(order_params)
        
        @order.book_id = @book
        @order.user = current_user
        if @order.save
            redirect_to order_checkout_path
        else
            redirect_to book_path(@book) , flash: { notice: 'Sorry! Something went wrong. Fill all fields and try again.'}
        end
    end

    def checkout
        @order = Order.where(user_id: current_user)
    end

    private

    def order_params
        params.require(:order).permit(:booking_date)
    end
end
