# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
Status.create(name:"Untested", color:"#FFFFFF", main_status:true) if Status.find_by_main_status(true).nil?

