class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end
  
  def create
    @post = Post.find(params[:post_id ])
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :body)
  end
end
