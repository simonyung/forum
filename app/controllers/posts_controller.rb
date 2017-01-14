class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @post = Post.all.order("created_at DESC")
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def new
    @post.user = current_user
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def show
    @post = Post.find params[:id]
  end

  def edit

  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
       @post.destroy(post_params)
      redirect_to root_path
  end

end
