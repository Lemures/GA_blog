class BloglyController < ApplicationController
  #before_action :authenticate_user!
    def index
      if user_signed_in?
        #@user = User.find(params[:id])
        @user = User.friendly.find(current_user.id)

        @posts = User.find(@user.id).posts

        @userFullName = [@user.firstName, @user.lastName].join(' ')

        #redirect_to users_path

        redirect_to user_path(@user)
      else

       redirect_to new_user_session_path

      end


    end

  def show

      #@user = User.find(params[:id])
      @user = User.friendly.find(params[:id])

      @posts = @user.posts

      @userFullName = [@user.firstName, @user.lastName].join(' ')

    #redirect_to @user

    #render 'blogly/test_show'


    #@posts = User.find(@user.id).posts


    #@userFullName = [@user.firstName, @user.lastName].join(' ')


  end



end

