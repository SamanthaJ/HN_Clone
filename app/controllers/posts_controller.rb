class PostsController < ApplicationController
  require 'will_paginate/array'
  before_action :authenticate_user!, except: :index
  

  def index
    @post = Post.new
    @posts = Post.all
    @comments = Comment.all
    if params[:latest]
      @posts = @posts.sort_by(&:created_at).reverse.paginate(:page => params[:page], :per_page => 10)
    elsif params[:comments]
      @posts = @posts.sort_by{|post| post.comments.count}.reverse.paginate(:page => params[:page], :per_page => 10)
    else params[:top] 
      @posts = @posts.order('cached_votes_up DESC').paginate(:page => params[:page], :per_page => 10)     
    end
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
    @post = Post.find(params[:id])
    @user_who_commented = current_user
    @comment = Comment.new
    @comments = @post.comments

  end

  def upvote
    @post = Post.find(params[:id])
    @post.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_by current_user
    redirect_to :back
  end


  private
  def post_params
    params.require(:post).permit(:link, :votes, :title)
  end
end