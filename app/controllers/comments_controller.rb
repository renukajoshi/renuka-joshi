class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    #raise params.inspect
    #@comments=Comment.all
    @comments=Post.find(params[:id]).comments
    @post=Post.find(params[:id])
    #raise @comments.inspect
   #@comments = Comment.find(:post_id => @post.id)
    respond_with(@comments)
  end

  def show
    respond_with(@comment)
  end

  def new
   # raise params.inspect
    @comment = Comment.new
    respond_with(@comment)
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    respond_with(@comment)
  end

  def update
    @comment.update(comment_params)
    respond_with(@comment)
  end

  def destroy
    @comment.destroy
    respond_with(@comment)
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :post_id)
    end
end
