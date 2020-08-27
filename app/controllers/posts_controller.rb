class PostsController < ApplicationController

    #CRUD

    #READ

    #INDEX route for all posts
    get '/posts' do 
        #leverage the model to get all posts from database
        @posts = Post.all 
        #store an array as an instance variable called posts . all then render in erb so you can access
        #render all posts
        erb :'posts/index'

    end 

    #show route for a single post

    #CREATE

    #UPDATE

    #DELETE
end 