class PostsController < ApplicationController

  def show

    @user = User.friendly.find(params[:user_id])



    # @post = User.friendly.find(params[:user_id]).posts.find(params[:id])
    @post = User.friendly.find(params[:user_id]).posts.friendly.find(params[:id])

    #redirect_to user_post_path(@user,@post)


  end

  def new


    @user = User.friendly.find(params[:user_id])

    @post = Post.new
  end

  def create

    @post = User.friendly.find(params[:user_id]).posts.create(post_params)

    @poster = Post.new

    if @poster.valid?

      redirect_to '/blogly'

    else

      @poster.errors.messages

    end


    # if @post.valid?
    #
    # redirect_to '/blogly'
    # else
    #   flash[:error] = 'oops, FIX IT'
    # end


  end

private

  def post_params
    params.require(:post).permit(:post_title, :post_text, :post_img)
  end

end
