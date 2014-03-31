class CommentpsController < ApplicationController
  before_filter :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @commentp = @post.commentps.create(params[:commentp])
    if @commentp.save
    redirect_to post_path(@post)
    else
   redirect_to post_path(@post), alert: "Comment can't be less than 10 characters."
      end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @commentp = @post.commentps.find(params[:id])
    @commentp.destroy
    redirect_to post_path(@post)
  end
end

