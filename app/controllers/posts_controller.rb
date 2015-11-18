class PostsController < ApplicationController
  #before_action :authenticate_user!

  def show

    @user = User.friendly.find(params[:user_id])



    @post = User.friendly.find(params[:user_id]).posts.find(params[:id])


  end

  def new
    #before_action :authenticate_user!

    @user = User.friendly.find(params[:user_id])

    @post = Post.new
  end

  def create

    User.friendly.find(params[:user_id]).posts.create(post_params)

    redirect_to '/blogly'
  end

private
  def post_params
    params.require(:post).permit(:post_title, :post_text, :post_image)
  end

end
