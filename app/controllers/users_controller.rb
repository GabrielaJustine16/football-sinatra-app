class UsersController < ApplicationController
#render login form
    get "/login" do
        erb :'users/login'
    end

        #recieve the data. the params
    post "/login" do 
        #find the user
        user = User.find_by(email: params[:email])
        #authenticate the user
        if user && user.authenticate(params[:password])
        #log them in
        #creating session for the user actually logs them in. key value pais in the sessions hash
        #logs them in 
        session[:user_id] = user.id
        #redirect them to users profile
        redirect "/users/#{user.id}"
        else 
            #show an error message
            redirect '/login'
        end  
        
    end 

        get "/users/:id" do 
            binding.pry
            @user = User.find_by(id: params[:id])
            erb :'users/show'
        end 
        #sign up
        #get sign up rout that renders signup form
        get '/signup' do 

            #render signup form
            erb :'/users/signup'
        end 

        post '/users' do 
            #will eventually need to add validation to confirm all inputs are filled out befor creating user
            @user = User.create(params)


        #post sign up route that rendures data from user create the user, and user id

        #log out
        #get logout that clears the sesion
    end 