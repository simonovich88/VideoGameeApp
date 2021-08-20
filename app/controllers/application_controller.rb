class ApplicationController < ActionController::Base

  # se usa por el error https://stackoverflow.com/questions/34664645/active-admin-devise-and-pundit-punditpolicyscopingnotperformederror consultar con cristobal
 before_action :authenticate_user!
  include Pundit
  protect_from_forgery with: :exception

  after_action :verify_authorized, except: [:index, :dashboard,:show, :edit, :delete, :news ], unless: :devise_controller?
  after_action :verify_policy_scoped, only: [:index] if controller_path.split('/').first == "admin"
  #after_action :verify_policy_scoped, only: :index, unless: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
  def authenticate_admin!
    redirect_to new_user_session_path unless current_user.admin?
  end

  private
  def pundit_user
    current_user
  end

  private
  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to(request.referrer || new_user_session_path)
  end
end
