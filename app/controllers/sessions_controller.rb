class SessionsController < ApplicationController
  before_action :already_login,only:[:new,:create]
  def new

  end

  def create
    @user = User.where(username: params[:username]).first

    if @user.username && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] =  "嗨 ! #{@user.username} , Welcome back"
      redirect_to root_path
    else
      flash.now[:errors] = '會員名稱或是密碼不符合'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = '已經成功登出'
    redirect_to root_path
  end
end