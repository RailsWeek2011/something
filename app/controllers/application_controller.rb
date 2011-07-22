class ApplicationController < ActionController::Base
  protect_from_forgery

  def is_admin?
    unless current_user.try(:admin?)
      redirect_to root_path
      flash[:notice]= "Falsche URL"
    end
  end 
end
