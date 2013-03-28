class PostsController < ApplicationController

  before_filter :cors_preflight_check

  # If this is a preflight OPTIONS request, then short-circuit the request,
  # return only the necessary headers and return an empty text/plain.
  def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin']  = '*'
      headers['Access-Control-Allow-Methods'] = 'GET, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
      headers['Access-Control-Max-Age']       = '1728000'
      render :text         => '',
            :content_type => 'text/plain'
    end
  end

  after_filter :cors_set_access_control_headers

  # For all responses in this controller, return the CORS access control
  # headers.
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'GET, OPTIONS'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  # before_filter :authenticate_admin!

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
