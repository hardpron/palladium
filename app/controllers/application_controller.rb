class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json'}
  # skip_before_filter :verify_authenticity_token, :only => [:listener]

  def after_sign_in_path_for(resource)
    products_path
  end

  protected
  def authenticate_user!
    if user_signed_in?
      super
    else
      if request.post?

      else
        redirect_to login_path, :notice => 'if you want to add a notice'
      end
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end
end
