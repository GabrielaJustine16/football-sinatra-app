class UsersController < ApplicationController
#render login form
    get '/login' do
        erb :login
    end

        #recieve the data. the params
    post '/login' do 
        #find the user
        user = User.find_by(email: params[:email])
        #authenticate the user
        if user && user.authenticate(params[:password])
        #log them in
        #creating session for the user actually logs them in. key value pais in the sessions hash
        binding.pry
        #redirect them to users profile
        else 
            #show an error message
            redirect '/login'
        end  
        
    end 


end 