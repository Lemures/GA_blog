class HomeController < ApplicationController
  #before_action :authenticate_user!
    def index
      if user_signed_in?
        @user = User.find(params[:id])

        @posts = User.find(@user.id).posts

        @userFullName = [@user.firstName, @user.lastName].join(' ')

        redirect_to users_path
      else

       redirect_to new_user_session_path

      end


      #@posts = User.find(@user.id).posts


      #@userFullName = [@user.firstName, @user.lastName].join(' ')



    end

  def show
      #@user = User.find(params[:id])

      @user = User.find(params[:id])
      #@user = User.find_by_username(params[:username])

      @posts = @user.posts

      @userFullName = [@user.firstName, @user.lastName].join(' ')

    #render 'home/test_show'


    #@posts = User.find(@user.id).posts


    #@userFullName = [@user.firstName, @user.lastName].join(' ')


  end

    def showUser
      #@user = User.find(params[:id])

      #@user = User.find(params[:id])
      @user = User.find_by_username(params[:username])

      @posts = @user.posts

      @userFullName = [@user.firstName, @user.lastName].join(' ')



      #@posts = User.find(@user.id).posts


      #@userFullName = [@user.firstName, @user.lastName].join(' ')



    end


end

