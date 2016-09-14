class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :configure_permitted_parameters, if: :devise_controller?

  #alias_method :current_user, :current_account
## I dont want that, then I need to use current_user

  # override cancancan method, where it expects a current_user method or ^ alias method if that is sufficient
  def current_ability
    @current_ability ||= Ability.new(current_account)
  end

end
