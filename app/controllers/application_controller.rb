class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # rescue_from CanCan::AccessDenied do |exception|
  #   respond_to do |format|
  #     format.json { render nothing: true, status: :forbidden }
  #     format.html { redirect_to main_app.root_url, :notice => exception.message }
  #     format.js   { render nothing: true, status: :forbidden }
  #   end
  # end

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

  private

  def soft_token
    session[:account_token] ||= SecureRandom.hex(8)
  end

end
