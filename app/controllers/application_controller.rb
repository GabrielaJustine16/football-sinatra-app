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

  get "/" do
    if logged_in? 
      redirect "/users/#{current_user.id}"
    else 
    erb :welcome
    end 
  end

  helpers do
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    #returns a boolean
    def logged_in?
      #current_user will return nil or the entire user object (we want true/false)
      !!current_user
    end

    def redirect_if_not_logged_in
      if !logged_in?
        flash[:errors] = "Must be logged in to view this page!"
        redirect '/login'
      end
    end

    def authorized_to_edit?(post)
      post.user == current_user
    end

  end

end