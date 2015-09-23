class MyLibraryController < ApplicationController
  def home
  	if admin_logged_in?
  		redirect_to current_admin
  	end
  end
end
