class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { render nothing: true, status: :forbidden }
      format.html { redirect_to main_app.root_url, :notice => exception.message }
      format.js   { render nothing: true, status: :forbidden }
    end
  end

  # CANCANCAN: override method, where it expects a current_user (instead of aliasing current_user, see wiki)
  def current_ability
    @current_ability ||= Ability.new(current_account)
  end

  # override Devise to allow for 'soft sign-up'
  def authenticate_account!
    current_account.present?
  end

  def current_account
    super || Account.where(soft_token: soft_token).first_or_initialize
  end

  protected

  # lazy way of permitting additional params for Devise (see Devise readme)
  # instead of creating a separate registrations_controller
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:soft_token])
  end

  private

  def soft_token
    session[:account_token] ||= SecureRandom.hex(8)
  end

end
