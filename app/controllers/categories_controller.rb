class CategoriesController < ApplicationController
  before_action :require_admin? ,only: [:new,:create]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(set_param)

    if @category.save
      flash[:notice] = "目錄建立成功"
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @category = Category.find_by(slug: params[:id])
  end

  private

  def set_param
    params.require(:category).permit(:name)
  end
end