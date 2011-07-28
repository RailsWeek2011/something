class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from Exception, :with => :record_not_found

  def is_admin?
    unless current_user.try(:admin?)
      redirect_to root_path
      flash[:notice]= "Falsche Url"
    end
  end

  private
    def record_not_found
      redirect_to root_path
      flash[:notice]= "You fail on a 404"
    end

end
