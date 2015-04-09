class PostsController < ApplicationController
  before_action :find_post,only: [:show,:edit,:update,:like,:destroy,:collect]
  before_action :require_user,only: [:new,:edit]
  before_action :require_admin?,only: [:new,:create,:edit,:update,:destroy]
  
  def index
    @post = Post.all.reverse
    @post = @post.paginate(:page => params[:page],:per_page => 10) #每10篇為一頁 

    @hotpost = Post.all.limit(10).sort_by{|x| x.like }.reverse
  end

  def show
    @comment = Comment.new
    @hotpost = Post.all.limit(10).sort_by{|x| x.like }.reverse
    render layout: 'with_sidebar'
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(set_params)
    @post.creator = current_user

    if @post.save
      flash[:notice] = '文章建立成功'
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @post.update(set_params)
      flash[:notice] = '文章更新成功'
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = '文章已被刪除'
      redirect_to root_path
    end
  end

  def like
    @like = Like.create(like: params[:like],likeable: @post,creator: current_user)
      respond_to do |format|
        format.js
      end 
  end

  def collect
    @collect = Collect.new(user_id: current_user.id, post_id: @post.id) 
  
    if !Collect.where(user_id: current_user.id,post_id: @post.id).exists?
      @collect.save
      flash[:notice]="收藏成功"
      redirect_to post_path(@post)
    else 
      flash[:error] ="已經收藏過了"
      redirect_to :back
    end
  end

 

  private

  def set_params
    params.require(:post).permit(:title,:url,:description,:collect,category_ids:[])
  end

  def find_post
    @post = Post.find_by(slug: params[:id])
  end
end