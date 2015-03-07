class DashboardController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:ipn_notification]
  def index
  end

  def listener
    params.merge!({'update_data' => Time.now.to_s})
    p params
    case params['act']
      when 'create_product'
        Product.create('name' => params['name'], 'status' => params['status'], 'version' => params['version'], 'update_data' => params['update_data'])
    end
    puts '
    ████████████████████████████████████████████████████
    █────██────██─████─████────██────███───██─█─██─███──█
    █─██─██─██─██─████─████─██─██─██──███─███─█─██──█───█
    █────██────██─████─████────██─██──███─███─█─██─█─█──█
    █─█████─██─██─████─████─██─██─██──███─███─█─██─███──█
    █─█████─██─██───██───██─██─██────███───██───██─███──█
    ████████████████████████████████████████████████████'
    render :something
  end
end
