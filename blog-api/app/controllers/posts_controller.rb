class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    render :json => @post
  end

  def index
    @posts = Post.all
    render :json => @posts
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      head :ok
    else
      head :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      head :ok
    else
      render :json => @post, :status => :unprocessable_entity
    end
  end

end
