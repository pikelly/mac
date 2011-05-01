class UsersController < ApplicationController
  skip_before_filter :login_required
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    (render :text => "Not taking any new accounts at this time" and return) unless @user.username =~/paul|rupert/
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thank you for signing up! You are now logged in."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
end
