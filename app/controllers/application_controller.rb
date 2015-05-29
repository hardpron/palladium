class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  acts_as_token_authentication_handler_for User, fallback_to_devise: false
  # acts_as_token_authentication_handler_for User
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  # skip_before_filter :verify_authenticity_token, :only => [:listener]

  def after_sign_in_path_for(resource)
    products_path
  end
end
