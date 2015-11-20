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

    if @post.post_title.valid?

      if  @post.post_text.valid?

        if  @post.post_img.valid?

          redirect_to '/blogly'

        else

          flash[:error] = "image file isn't valid type"

        end

      else
        flash[:error] = 'least on character is require in you body'
      end

    else
      flash[:error] = 'It is likely, that you already used this title before try add a slight variant'
    end

    # redirect_to '/blogly'

  end

private

  def post_params
    params.require(:post).permit(:post_title, :post_text, :post_img)
  end

end
