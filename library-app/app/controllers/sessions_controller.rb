class SessionsController < ApplicationController
  def new_user
    if user_logged_in?
      redirect_to current_user
    end
  end

  def create_user
  	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    	log_in_user user
      redirect_to user
    else
      flash[:error] = "Invalid email/password. Please try again."
      render 'new_user'
    end
  end

  def new_admin
     if admin_logged_in?
      redirect_to current_admin
    end
  end

  def create_admin
    admin = Admin.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      log_in_admin admin
      redirect_to admin
    else
      flash[:error] = "Invalid email/password. Please try again."
      render 'new_admin'
    end
  end

  def destroy_user
    log_out_user
    redirect_to root_url
  end

  def destroy_admin
    log_out_admin
    redirect_to root_url
  end
end
