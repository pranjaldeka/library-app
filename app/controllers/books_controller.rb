class BooksController < ApplicationController

  before_action :logged_in_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    if params[:search]
      @books = Book.search(params[:search]).order("created_at DESC").page(params[:page]).per(20)
    else
      @books = Book.page(params[:page]).per(20)
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      flash[:error] = "Could not add book"
      render 'new'
    end
  end

  def show
    @book = Book.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_url
    @users = @book.users
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:isbn, :title, :description, :author, :status)
  end
end

