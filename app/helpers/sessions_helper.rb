module SessionsHelper

  #user specific methods
  def log_in_user(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def user_logged_in?
    !current_user.nil?
  end

  def log_out_user
    session.delete(:user_id)
    @current_user = nil
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

  #Admin specific methods
  def log_in_admin(admin)
    session[:admin_id] = admin.id
  end

  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id])
  end

  def admin_logged_in?
    !current_admin.nil?
  end

  def log_out_admin
    session.delete(:admin_id)
    @current_admin = nil
  end


  def logged_in_admin
    unless admin_logged_in?
     redirect_to login_admin_url
   end
 end

 def right_admin
  @admin = Admin.find(params[:id])
  redirect_to(root_url) unless @admin == current_admin
end
end