class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  #before_filter :authenticate_user!
  #before_filter :require_user
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    #raise params.inspect
    @posts = Post.where(user_id:current_user.id)
    #@tags =@posts.tags
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
   @post = Post.find(params[:id])
  #@category=@post.categories
   @comment=@post.comments
  end

  # GET /posts/new
  def new
    @post = Post.new
    #@ask.userid=current_user.id
    #@comment=@post.comments.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    #session[:current_user_id] = @user.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end

    end

    #if @post.save
     # @post.tags.build
    #end

    #========================
    #for Tags using check box
     #@post.save
      #some_hash=params[:post]
      #s = some_hash["tag_id"].size
      #for i in 0..s
       # puts "#{i} => #{some_hash["tag_id"][i]}"

       #@post = Tag.new(:post_id => @post.id , :tag_id => some_hash["tag_id"][i])
       #@post.save
      #end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:Title, :Description, {:tag_id =>[]})
    end
end
