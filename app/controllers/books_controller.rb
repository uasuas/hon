class BooksController < ApplicationController
  def index
    @booknew = Book.new
    @books = Book.all
  end

  def show
    @booknew = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
  end

  def create
    @booknew = Book.new(book_params)
    @booknew.user_id = current_user.id
    if @booknew.save
      flash[:notice] = "ok"
      redirect_to books_path
    else
      flash[:notice] = "ng"
    end
  end

  def update
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
