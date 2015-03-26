class VideoPostsController < ApplicationController
  

  before_action :require_user,only: [:new,:create,:edit,:update]
  before_action :find_video_post ,only: [:edit,:show,:update]

  def index
    @videopost = VideoPost.all.sort_by{|video| video.average_rating }.reverse
    @videopost = @videopost.paginate(:page => params[:page],:per_page => 6) 
  end

  def new
    @videopost = VideoPost.new
  end

  def create
    @videopost = VideoPost.new(set_params)
    @videopost.creator = current_user

    if @videopost.save
      flash[:notice] = "#{@videopost.title} 發佈成功"
      redirect_to video_posts_path
    else
      render :new
    end
  end

  def edit
   
  end

  def update

    if @videopost.update(set_params)
      flash[:notice] = '更新成功'
      redirect_to video_post_path(@videopost)
    else
      render :edit
    end
  end

  def show
    
    @comment = VideoComment.new
  end


  private

  def set_params
    params.require(:video_post).permit(:title,:url,:description)
  end

  def find_video_post
    @videopost = VideoPost.find(params[:id])
  end

  
end