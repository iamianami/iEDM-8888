class CommentsController < ApplicationController
  before_action :find_post,only: [:create,:destroy,:like]
  before_action :require_admin? ,only: [:destroy]

  def create
    
    @comment = @post.comments.new(set_param)
    @comment.creator = current_user

    if @comment.save
      flash[:notice] = '留言成功'
      redirect_to :back
    else
      render 'posts/show'
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      flash[:error] = '留言已刪除'
      redirect_to :back
    end
      
  end

  def like
    @comment = @post.comments.find(params[:id])
    @like = Like.create(creator: current_user,likeable: @comment,like: params[:like])

    respond_to do |format|
      format.js
    end
  end

  private

  def set_param
    params.require(:comment).permit(:body)
  end

  def find_post
    @post = Post.find_by(slug: params[:post_id])
  end
end