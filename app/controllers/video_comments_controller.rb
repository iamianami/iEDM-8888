class VideoCommentsController < ApplicationController
  before_action :find_video_post,only: [:create]
  before_action :require_user,only: [:create]


  def create
    @comment = @videopost.video_comments.new(set_param)
    @comment.creator = current_user

    if @comment.save
      flash[:notice] = '留言成功'
      redirect_to :back
    else
      render 'video_posts/show'
    end
  end

  

  private

  def set_param
    params.require(:video_comment).permit(:body,:rating)
  end

  def find_video_post
    @videopost = VideoPost.find(params[:video_post_id])
  end


end