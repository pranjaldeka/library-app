class AdminsController < ApplicationController
  before_action :logged_in_admin, only: [:edit, :update, :show]
  before_action :right_admin,   only: [:edit, :update]

  def index
    @admins = Admin.page(params[:page]).per(20)
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(user_params)
    if Admin.find_by(email: params[:admin][:email])
      flash.now[:error] = "Admin already exists."
      render 'new'
    else
      if @admin.save
        flash[:success] = "Admin account created successfully"
        redirect_to root_path
      else
        flash.now[:error] = @admin.errors.full_messages.to_sentence
        render 'new'
      end
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
      flash[:success] = "Profile updated successfully!"
      redirect_to @admin
    else
      render 'edit'
    end
  end

  def destroy
    Admin.find(params[:id]).destroy
    flash[:success] = "Admin deleted successfully!"
    redirect_to admins_url
  end

  private
  def user_params
    params.require(:admin).permit(:first_name, :last_name, :email,
                                  :password, :password_confirmation)
  end

end
