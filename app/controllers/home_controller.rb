class HomeController < ApplicationController
  before_action :authenticate_user!
    def index
      @user = current_user

      @posts = User.find(@user.id).posts

      @userFullName = [@user.firstName, @user.lastName].join(' ')


    end

end

