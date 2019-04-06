class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
    render :form
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    post = Post.new(post_parameters)
    post.user_id = current_user.id
    if post.save
      redirect_to post_path(post)
    else
      p post.errors
      redirect_to root_path
    end

  end

  private

  def post_parameters
    params.require(:post).permit(:description, :url)
  end
end
