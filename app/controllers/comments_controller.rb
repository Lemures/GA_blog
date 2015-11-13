class CommentsController < ApplicationController

def new
  @user = current_user

  @post = Post.find(params[:post_id])

end
    def create
      @user = current_user

      Comment.create(user_id: params[@user.id], post_id: params[:post_id])
    end

end
