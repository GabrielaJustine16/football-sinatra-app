class UsersController < ApplicationController
#render login form
#change "" to '
    get '/login' do
        erb :login
    end

        #recieve the data. the params
    post '/login' do 
        #find the user
        @user = User.find_by(email: params[:email])
        #authenticate the user
        if @user && @user.authenticate(params[:password])
        #log them in
        #creating session for the user actually logs them in. key value pais in the sessions hash
        #logs them in 
        session[:user_id] = @user.id
        #redirect them to users profile
        flash[:message] = "Welcome back #{@user.name}!"
        redirect "/users/#{@user.id}"
        else 
            # [x] show an error
      flash[:errors] = "Wrong credentials!"
            #show an error message
            redirect '/login'
        end  
        
    end 
#users show routee
        get '/users/:id' do 
            
            #find the user
            @user = User.find_by(id: params[:id])
            erb :'/users/show'
        end 
        #sign up
        #get sign up rout that renders signup form
        get '/signup' do 

            #render signup form
            erb :signup
        end 

        post '/users' do 
            #will eventually need to add validation to confirm all inputs are filled out befor creating user
            @user = User.new(params)
            if @user.save
                #[x] log them in - creating a session, adding a key/value pair to session hash



        #post sign up route that rendures data from user create the user, and user id
            session[:user_id] = @user.id
            flash[:message] = "#{@user.name}, Welcome" 
            redirect "/users/#{@user.id}"
        else
            #not valid input
            flash[:errors] = "Failed to create your account: #{@user.errors.full_messages.to_sentence}"
            redirect '/signup'

        end 
    end 

    #log out
        #get logout that clears the sesion
        get '/logout' do 
            session.clear 
            #redirect to home landing page
            redirect '/'
        end 
    end 