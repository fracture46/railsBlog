class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
      @comment = Comment.new post_attributes
      @comment.user = current_user
      @post = Post.find(@comment.post_id);
      @comment.post = @post
      @comment.save
      redirect_to @post
    end

    def post_attributes
      params[:comment].permit(:content, :user_id, :post_id, :posted_at)
    end
end
