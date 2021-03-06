class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: "text/html" }
      format.html { redirect_to main_app.root_url, :notice => exception.message }
      format.js   { head :forbidden, content_type: "text/html"}
    end
  end

  # CANCANCAN: override method, where it expects a current_user (instead of aliasing current_user, see wiki)
  def current_ability
    @current_ability ||= Ability.new(current_account)
  end

  # override Devise to allow for 'soft sign-up'
  def authenticate_account!(*args)
    current_account.present? || super(*args)
  end

  def current_account
    super || Account.where(soft_token: soft_token).first_or_initialize
  end

  private

  def soft_token
    session[:account_token] ||= SecureRandom.hex(8)
  end

end
