class PostsController < ApplicationController

  def new
    @post = Post.new
    @post.place_id = params["place_id"]
  end

  def create
    if @current_user
      @post = Post.new(params["post"])
      @post.user_id = session[:user_id]
      @post.save
      redirect_to "/places/#{@post.place_id}"
    else
      flash[:notice] = "Login first."
      redirect_to "/users/new"
    end
  end

end
