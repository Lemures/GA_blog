class PostsController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user

    @post = User.find(@user.id).posts.find(params[:id])

    render 'posts/post'

  end

  def new
   @user = User.find(params[:user_id])

   @post = Post.new
  end

  def create

    User.find(params[:user_id]).posts.create(post_params)

    redirect_to '/home'
  end

private
  def post_params
    params.require(:post).permit(:post_title, :post_text, :post_image)
  end

end
