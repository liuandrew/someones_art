# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

APP_ADMIN = YAML.load_file(Rails.root.join('config', 'admin.yml'))