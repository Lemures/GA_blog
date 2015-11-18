class BloglyController < ApplicationController
  #before_action :authenticate_user!
    def index
      if user_signed_in?
        #@user = User.find(params[:id])
        @user = current_user

        @posts = User.find(@user.id).posts

        @userFullName = [@user.firstName, @user.lastName].join(' ')

        #redirect_to users_path
      else

       redirect_to new_user_session_path

      end


      #@posts = User.find(@user.id).posts


      #@userFullName = [@user.firstName, @user.lastName].join(' ')



    end

  def show

      #@user = User.find(params[:id])
      @user = User.friendly.find(params[:id])

      @posts = @user.posts

      @userFullName = [@user.firstName, @user.lastName].join(' ')

    #render 'blogly/test_show'


    #@posts = User.find(@user.id).posts


    #@userFullName = [@user.firstName, @user.lastName].join(' ')


  end



end

