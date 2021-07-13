class BooksController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :index, :show ]
    def index
        @books = Book.all
    end

    def show
        @book = Book.find(params[:id])
        @order = Order.new
    end

    def new
    @book = Book.new
    end

    def create
        @book = Book.new(book_params)

        if @book.save
            redirect_to book_path(@book)
        else
            render :new
        end
    end

    private

    def book_params
        params.require(:book).permit(:name, :description , :delivery_estimate, :sku, :price_cents, photos: [])
    end

end
