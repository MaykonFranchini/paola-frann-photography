class OrdersController < ApplicationController
        
    def create
        @user = current_user
        @order = Order.new(order_params)
    end

    private

    def order_params
        params.require(:order).permit(:date)
    end
end
