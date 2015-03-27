class UsersController < ApplicationController
  before_action :find_user, only: [:show,:edit,:update]

  def show
      @collect = Collect.where(user_id: @user.id) 
      @collect_posts = []
      
      @collect.each do |collect|
        @collect_posts << Post.find(collect.post_id) 
      end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(set_param)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = '帳號建立成功'
      redirect_to root_path
    else
      render :new
    end

  end

  def edit

  end

  def update
    if @user.update(set_param)
      flash[:notice] = '會員資料更新成功'
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def set_param 
    params.require(:user).permit(:username,:password,:gender,:address,:birthday,:avatar)
  end

  def find_user
    @user = User.find_by(slug: params[:id])
  end
end