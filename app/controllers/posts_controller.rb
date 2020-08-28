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
        redirect_if_not_logged_in

        erb :'posts/new'
    end 

    #post route for post 
    post "/posts" do 
#recieve the params that the user put into the create form
    #active record method to create this post and eventually we nee d the user id. we will get it by leveraging
        post = Post.new(title: params[:title], highlight_url: params[:highlight_url],desctription: params[:description],user_id: current_user.id )
        if @post.save
            flash[:message] = "Post created!"    
            
            
            #redirect to post show page 
        redirect "/posts/#{post.id}"
        #can be a plain ruby variable and we can leverage the id. we added the post= 
    else
        flash[:errors] = "Post creation failure: #{@post.errors.full_messages.to_sentence}"
        redirect '/posts/new'
      end
    end 

    #show route for a single post
    #dynamic id-each post has an id, and we have to get from post page
    #params is how we access id
    get 'posts/:id' do 
        #find the post
        # id is coming from url - params
    find_post
    erb :'posts/show'
  end

    #CREATE

    #UPDATE
    get '/posts/:id/edit' do 
        redirect_if_not_logged_in
        find_post
        if authorized_to_edit?(@post)
          erb :'/posts/edit'
        else
          flash[:errors] = "Not authorized to edit post."
          redirect "/posts/#{@post.id}"
        end
      end

    # patch route to update a existing post
  patch '/posts/:id' do
    find_post
    @post.update(title: params[:title], highlight_url: params[:highlight_url], description: params[:description])
    redirect "/posts/#{@post.id}"
  end

  # DELETE
  # delete rotue to delete and existing post
  delete '/posts/:id' do
    # we need the id to FIND the post to delete
    find_post
    if authorized_to_edit?(@post)
      @post.destroy
      flash[:message] = "Successfully deleted post!"
      redirect '/posts'
    else
      flash[:errors] = "You're not authorized to delete this post."
      redirect "/posts/#{@post.id}"
    end
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

end
