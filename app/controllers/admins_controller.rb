class AdminsController < ApplicationController
  before_action :logged_in_admin, only: [:edit, :update]
  before_action :right_admin,   only: [:edit, :update]

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(user_params)
    if @admin.save
      flash[:success] = "Account created successfully"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(user_params)
      redirect_to @admin
    else
      render 'edit'
    end
  end

  def destroy
    Admin.find(params[:id]).destroy
    redirect_to admins_url
  end

  private
  def user_params
    params.require(:admin).permit(:first_name, :last_name, :email,
                                  :password, :password_confirmation)
  end

end
