class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
     @tags=Post.find(params[:id]).tags
    #@post=Post.find(params[:id])
    @tags = Tag.find(params[:id])
    respond_with(@tags)
  end

  def show
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
