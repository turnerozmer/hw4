class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.where({ email: params["email"] })[0]
    if @user
      if BCrypt::Password.new(@user.password) == params["password"]
        session[:user_id] = @user.id
        flash[:notice] = "Lets add some places!"
        redirect_to "/places"
      else
        flash[:notice] = "Sorry, try again."
        redirect_to "/sessions/new"
      end
    else
      flash[:notice] = "Sorry, try again."
      redirect_to "/sessions/new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Goodbye."
    redirect_to "/sessions/new"
  end
end
  