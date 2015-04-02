require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  require 'will_paginate/array' 
  require 'pry'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user,:logged_in?

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !current_user
      flash[:error] = '請先登入會員'
      redirect_to login_path
    end
  end

  def require_admin?
    if !current_user.admin?
      flash[:error] = '只有iEDM Writer才能發文喔'
      redirect_to root_path
    end
  end

  def already_login
    if current_user
      flash[:error] = "你已經登入囉"
      redirect_to root_path
    end
  end

  
end
