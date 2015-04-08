class VideoPostsController < ApplicationController
  

  before_action :require_user,only: [:new,:create,:edit,:update]
  before_action :find_video_post ,only: [:edit,:show,:update]
  before_action :require_creator ,only: [:edit,:update]

  def index
    @videopost = VideoPost.all.reverse
    @hotvideopost = VideoPost.all.limit(10).sort_by{|video| video.average_rating }.reverse

    @videopost = @videopost.paginate(:page => params[:page],:per_page => 9) 
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
    @hotvideopost = VideoPost.all.limit(10).sort_by{|video| video.average_rating }.reverse
    @comment = VideoComment.new
  end


  private

  def set_params
    params.require(:video_post).permit(:title,:url,:description)
  end

  def find_video_post
    @videopost = VideoPost.find(params[:id])
  end

  def require_creator
    if current_user != @videopost.creator
      flash[:error] = '只有文章發布本人才可以修改文章喔！'
      redirect_to video_post_path(@videopost)
    end
  end

  
end