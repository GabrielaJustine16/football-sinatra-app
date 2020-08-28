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
    #create
    get "/posts/new" do 

        erb :"posts/new"
    end 

    #show route for a single post
    #dynamic id-each post has an id, and we have to get from post page
    #params is how we access id
    get 'posts/:id' do 
        #find the post
        @post = Post.find(params[:id])
        erb :"/posts/show"


    end 

    #CREATE

    #UPDATE

    #DELETE
end 