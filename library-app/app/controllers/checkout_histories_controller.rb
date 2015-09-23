class CheckoutHistoriesController < ApplicationController

  def show_book
    @book = Book.find(params[:id])
  #rescue ActiveRecord::RecordNotFound
    #redirect_to root_url
    #@users = @book.users
    #render 'show_user'
  end

  def show_user
    @user = User.find(params[:id])
  #rescue ActiveRecord::RecordNotFound
  #  redirect_to root_url
  #  @book = @user.books
  #  render 'show_book'
  end

  def create
    @book = Book.find(params[:id])
    if @book.checkout_histories.create(user: current_user,issued_at: Time.now)
      @book.update(status: "Checked out")
      redirect_to @book
    else
      flash[:error] = "Checkout failure!"
      render @book
    end
  end

  def create_admin
    @book = Book.find(params[:id])
    @user = User.find_by(email: params[:user][:email])
    if @user.nil?
      flash[:error] = "Invalid User!"
      render @book
    end
    if @book.checkout_histories.create(user: @user,issued_at: Time.now)
      @book.update(status: "Checked out")
      redirect_to @book
    else
      flash[:error] = "Checkout failure!"
      render @book
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.checkout_histories.last.update_attributes(returned_at: Time.now)
      @book.update(status: "Available")
      redirect_to @book
    else
      flash[:error] = "Return failure!"
      render @book
    end
  end
end
