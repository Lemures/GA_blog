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

    #@post.valid?

    @posterValid = @post.errors.to_a

  end

  def create
    # User.friendly.find(params[:user_id]).posts.create(post_params)



    @poster = User.friendly.find(params[:user_id]).posts.create(post_params)



     if @poster.valid?


      redirect_to '/blogly'

     else


      redirect_to new_user_post_path

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
