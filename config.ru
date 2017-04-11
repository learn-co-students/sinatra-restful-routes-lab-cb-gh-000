require './config/environment'
require "better_errors"

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

configure :development do
  BetterErrors.application_root = File.expand_path("..", __FILE__)
end

use BetterErrors::Middleware if ENV['SINATRA_ENV'] == 'development'
use Rack::MethodOverride
run ApplicationController
