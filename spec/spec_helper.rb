require 'rubygems'
require 'bundler/setup'

require 'active_support/all'

require 'active_record'
require 'factory_girl'
require 'faker'
require 'database_cleaner'

require './spec/factories'

require './app/models/user'
require './app/models/activity'
require './app/models/activity_type'
require './app/models/preference'

include FactoryGirl::Syntax::Methods

# require './models/suite'
# require './models/booking'

# require './factories/suites'
# require './factories/bookings'

# Connect to the DB
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => "db/db.sqlite3"
)

# Recreate the database
ActiveRecord::Migration.suppress_messages do
  require './db/schema.rb'
end



RSpec.configure do |config|
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
end

I18n.enforce_available_locales = false
