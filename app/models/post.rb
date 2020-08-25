class Post < ActiveRecord::Base

    belongs_to :user
    #relying on user id column
end
