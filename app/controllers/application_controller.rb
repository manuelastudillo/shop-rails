class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

include Pundit

    private

  def not_authenticated
    flash[:warning] = 'Tienes que autenticarte para acceder a esta página.'
    redirect_to log_in_path
end


 protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    redirect_to(request.referrer || root_path, alert: 'Not autorized')
end

protected
def authenticate_admin!
	redirect_to root_path unless current_user.is_admin?
end



end
