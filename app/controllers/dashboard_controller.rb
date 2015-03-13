class DashboardController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:ipn_notification]
  def index
  end
end
