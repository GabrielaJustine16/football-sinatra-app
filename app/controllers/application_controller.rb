require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    #enables the sessions hasgh
    enable :sessions
    #set a sessions secret for an extra layer of security
    set :session_secret, "super_secret_session"
  end

  get '/' do

    erb :welcome
  end

end

