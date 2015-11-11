class PostController < ApplicationController

  def show
    render 'post/post'
  end

  def new
   @user = User.find(params[:user_id])
  end
end
