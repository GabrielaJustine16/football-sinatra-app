require './config/environment'



if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#here is where i will mount other controlers with our keyword 'use'
#in order to send PATCH and DELETE request i need

#use Rack::MethodOverride
run ApplicationController
use UsersController
