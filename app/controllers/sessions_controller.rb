class SessionsController < ApplicationController
  def new
  end

  def create
    username = User.find_by(username: params[:user][:username])
    password = params[:user][:password]

    if username && username.authenticate(password)
      session[:user_id] = username.id
      redirect_to root_path, notice: "Logged in successfully."
    else
      redirect_to login_path, alert: "Invalid username/password combination."
    end
  end

  def destroy
    reset_session # wipe out session and everything in it
    redirect_to login_path, notice: "You have been logged out."
  end

end
