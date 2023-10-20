class BooksController < ApplicationController
  def index
    @booknew = Book.new
    @books = Book.all
  end

  def show
    @booknew = Book.new
    @book = Book.find(params[:id])
  end

  def edit
  end
  
  def create
    @booknew = Book.new(book_params)
    @booknew.user.id = current.user.id
    if @booknew.save
      flash[:notice] = "ok"
    else
      flash[:notice] = "ng"
    end
  end

  def update
  end

  def destroy
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
