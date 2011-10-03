# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Simple::Application.initialize!
require 'amazon/ecs'
Amazon::Ecs.debug = true
Amazon::Ecs.options = {
  :AWS_access_key_id => "AKIAJTV5CT5MGHKKJKSA",
  :associate_tag => "recode-22",
  :country => :jp,
  :AWS_secret_key => "dsAi7cTIg2mRlwRq/pPdIQg4dSVDcBCfxsiRMWB5"
}
