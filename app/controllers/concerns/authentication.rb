module Authentication
  extend ActiveSupport::Concern

  included do
    helper_method :admin_signed_in?
  end

  def redirect_if_authenticated
    redirect_to root_path, danger: "You are already logged in." if admin_signed_in?
  end

  def redirect_if_not_logged_in
    store_location
    redirect_to new_admin_path, danger: "You must log in first" unless admin_signed_in?
  end

  private
  def admin_signed_in?
    !session[:admin_id].nil?
  end

  def store_location
    session[:user_return_to] = request.original_url if request.get?
  end

end