class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  #layout "home"


  respond_to :html

  def index
#<<<<<<< HEAD
    #raise params.inspect
    @all_tags =Tag.all
     
     #raise @tag_name.inspect
    
    respond_with(@tags)
  end

  def show
#<<<<<<< HEAD
     #@tag = Tag.find(params[:id])
     @tag=Join.where(:tag_id => params[:id])
     # @tag=Join.where(:tag_id => params[:id])
      @tag_name = Tag.find(params[:id])
     #@post = Post.find(params[:post_id])
#=======
     #@post = Post.find(params[:post_id])
#>>>>>>> 6710ac8f009fce6b606133c48f6f9ac60db433f5
    respond_with(@tag)
  end

  def new
    @tag = Tag.new
    respond_with(@tag)
  end

  def edit
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save
    respond_with(@tag)
  end

  def update
    @tag.update(tag_params)
    respond_with(@tag)
  end

  def destroy
    @tag.destroy
    respond_with(@tag)
  end

  private
    def set_tag
      @tag = Tag.find(params[:id])
    end

    def tag_params
      params.require(:tag).permit(:name, :post_id)
    end
end
