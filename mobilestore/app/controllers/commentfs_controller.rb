class CommentfsController < ApplicationController
  before_filter :authenticate_user!
  def create
    @forum = Forum.find(params[:forum_id])
    @commentf = @forum.commentfs.create(:body => params[:commentf].first[1], :user_id => current_user.id)
    if @commentf.save
      redirect_to forum_path(@forum)
    else
      redirect_to forum_path(@forum), alert: "Reply can't be less than 10 characters."
    end
  end



  def destroy
    @forum = Forum.find(params[:forum_id])
    @commentf = @forum.commentfs.find(params[:id])
    @commentf.destroy
    redirect_to forum_path(@forum)
  end
end
