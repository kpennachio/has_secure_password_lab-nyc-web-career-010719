class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    @user = @user.try(:authenticate, params[:user][:password])
    if @user
      session[:user_id] = @user.id
      redirect_to controller: 'welcome', action: 'index'
    else
      redirect_to controller: 'sessions', action: 'new'
    end
  end

end
