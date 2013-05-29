class BooksController < ApplicationController
  inherit_resources
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @user = current_user
    @books = Book.order("reputation DESC")
    @book_of_the_month = Book.book_of_the_month
  end

  def update
    update! { books_path }
  end

  def create
    @book = Book.new(params[:book])
    @book.user = current_user
    if @book.save
      redirect_to books_path, notice: "Book was successfully created"
    else
      render :new
    end
  end

end
