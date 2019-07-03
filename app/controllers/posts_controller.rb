class PostsController < ApplicationController
    before_action :load_post, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new, :create, :update, :destory]
    
    def index
      @posts = Post.all.order(:date_publication)
    end
    def new
      @post = Post.new
    end
    def create
      @post = Post.new post_attributes
      @post.user = current_user
      if @post.save
        redirect_to @post
      else
        render :new
      end
    end
    def update
      if @post.update post_attributes
        redirect_to @post
      else
        render :edit
      end
    end
    def destroy
      @post.destroy
      redirect_to :posts
    end

    def post_attributes
       params[:post].permit(:titre, :date_publication, :chapeau, :image, :corps, :user_id)
    end
  
    def load_post
      @post = Post.find(params[:id])
    end
end
