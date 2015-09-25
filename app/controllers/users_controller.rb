  class UsersController < ApplicationController
    before_action :logged_in_user, only: [:edit, :update, :show]
    before_action :right_user,   only: [:edit, :update, :show]
    before_action :logged_in_admin, only: [:index, :destroy]

    def new
      @user = User.new
    end

    def create
     @user = User.new(user_params)
     if User.find_by(email: params[:user][:email])
       flash.now[:error] = "User already exists."
       render 'new'
     else
       if @user.save
         log_in_user @user
         flash[:success] = "Account created successfully."
         redirect_to @user
       else
         render 'new'
       end
     end
   end

   def show
     @user = User.find(params[:id])
   end

   def edit
    @user = User.find(params[:id])
   end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated successfully."
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.page(params[:page]).per(20)
  end

  def destroy
    @user = User.find(params[:id])
    if @user.checkout_histories.any? {|val| val.book.status == "Checked out" }
      flash[:error] = "User has checked out books. Cannot be deleted."
      redirect_to users_path
    else
      flash[:success] = "User deleted successfully."
      @user.destroy
      redirect_to users_url
    end
  end

  private
  def user_params
   params.require(:user).permit(:first_name, :last_name, :email,
    :password, :password_confirmation)
 end
end
