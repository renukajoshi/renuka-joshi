class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  #before_filter :authenticate_user!
  before_filter :load_category
  # GET /posts
  # GET /posts.json

  #respond_to :html

  def index
    #raise params.inspect
    #@tag=Tag.find(params[:id]).posts
    #@post=Post.find(params[:id])
    #raise params.inspect
    @posts = @category.posts
    #@tags =@posts.tags
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
   @post = Post.find(params[:id])
  #@category=@post.categories
   @comment=@post.comments
   @tag=@post.tags
  end

  # GET /posts/new
  def new
    #raise params.inspect
    @category = Category.find(params[:category_id])
    #@tag= Tag.find(params[:id])
    @post = @category.posts.new
    @all_tags =Tag.all
    #@post_tag = @post.tags.build
    #raise @post_tag.inspect
    
    #@ask.userid=current_user.id
    #@comment=@post.comments.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    
    @category=Category.find(params[:category_id])
    #@post=@category.posts.new
    puts post_params
    @post = @category.posts.create(post_params)
    @post.user_id = current_user.id

   
    #@post=category.posts.create(params[:posts])
    #@post.save
    #respond_with(category_posts_path)
    #session[:current_user_id] = @user.id
    respond_to do |format|
      if @post.save

         some_hash = params.require(:tag_ids)
         s= some_hash.size
          for i in 0...s
          @join = Join.new(:post_id  =>@post.id ,:tag_id => some_hash[i])
          @join.save
            end
          #raise s.inspect
        format.html { redirect_to category_posts_path , notice: 'Post was successfully created.'}
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
    @post.user_id = current_user.id
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to category_posts_path, notice: 'Post was successfully updated.' }
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

    def load_category
      @category = Category.find(params[:category_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:Title, :Description,:tag_id,:user_id)
    end
end
