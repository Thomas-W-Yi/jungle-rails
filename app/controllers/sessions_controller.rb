class SessionsController < ApplicationController
  def create
    @user = User.where(email: params[:email]).first
    if @user and @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/', success: "You have signed in!"
    else
      redirect_to '/login', danger: "Invalid email or password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
