class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

 #layout "home"

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
    #raise params.inspect
     @post = Post.find(params[:post_id])
     #@post=@comment.posts
    respond_with(@comment)
  end

  def new
   # raise params.inspect
   @post=Post.find(params[:post_id])
    @comment = @post.comments.new
    respond_with(@comment)
  end

  def edit
  end

  def create
     @post=Post.find(params[:post_id])
    #@post=@category.posts.new
    #puts post_params
    @comment = @post.comments.build(comment_params)
    @comment = Comment.new(comment_params)
    #@comment.save
    #respond_with(@comment)
    if @comment.save
     flash[:notice] = "Comment was created"
      redirect_to category_post_path(@post.category,@post)
   else 
     flash[:error] = "Comment failed to save"
   end

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
