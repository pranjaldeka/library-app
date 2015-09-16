class UsersController < ApplicationController
    before_action :logged_in_user, only: [:edit, :update, :show]
    before_action :right_user,   only: [:edit, :update, :show]
    before_action :logged_in_admin, only: [:index, :destroy]

	def new
		@user = User.new
	end
    
    def create
    	@user = User.new(user_params)
    	if @user.save
    		redirect_to @user
    	else 
    		render 'new'
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
            redirect_to @user
        else
            render 'edit'
        end
    end

    def index
        @users = User.all
    end

    def destroy
        User.find(params[:id]).destroy
        redirect_to users_url
    end

  private
    def user_params
    	params.require(:user).permit(:first_name, :last_name, :email,
    	 :password, :password_confirmation)
    end

    def logged_in_user
        unless user_logged_in?
            redirect_to login_user_url
        end
    end

    def right_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless @user == current_user
    end
end
