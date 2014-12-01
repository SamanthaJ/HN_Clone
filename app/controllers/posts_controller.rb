class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @posts = Post.all
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def create
    @posts = Post.all
    @post = current_user.posts.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private
  def post_params
    params.require(:post).permit(:link, :votes)
  end
end