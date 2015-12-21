class SessionsController < ApplicationController
  def create
    username = params[:username]
    session[:current_user_name] = username

    flash.now[:notice] = "Welcome #{username}!"

    head :ok
  end

  def destroy
    session.clear

    head :ok
  end
end
