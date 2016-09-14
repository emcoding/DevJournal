class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # CANCANCAN: override method, where it expects a current_user (instead of aliasing current_user, see wiki)
  def current_ability
    @current_ability ||= Ability.new(current_account)
  end

end
