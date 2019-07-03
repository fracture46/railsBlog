class UsersController < ApplicationController
    before_action :load_user, only: [:show, :edit, :update, :destroy]
    #before_action :authenticate_user!
    
    def index
      @users = User.all.limit(20).order(:last_name)
    end
    def new
      @user = User.new
    end
    def create
      @user = User.new user_attributes
      if @user.save
        redirect_to user
      else
        render :new
      end 
    end
    def update
      if @user.update user_attributes
        redirect_to @user
      else
        render :edit
      end
    end
    def destroy
      @user.destroy
      redirect_to :users
    end
    
    def user_attributes
       params[:user].permit(:first_name, :last_name, :email)
    end
  
    def load_user
      @user = User.find(params[:id])
    end
  end
  