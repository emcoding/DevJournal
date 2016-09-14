class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  alias_method :current_user, :current_account

  # # override cancancan method, where it expects a current_user method or ^ alias method if that is sufficient
  # def current_ability
  #   @current_ability ||= AccountAbility.new(current_account)
  # end
end
