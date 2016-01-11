class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  #layout "home"

  respond_to :html

  def index
    @categories= Category.all
    #@categories=Post.find(params[:id]).categories
    #@post=Post.find(params[:id])
    respond_with(@categories)
  end

  def show
    respond_with(@category)
  end

  def new
    @category = Category.new
    respond_with(@category)
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    @category.save
    respond_with(@category)
  end

  def update
    @category.update(category_params)
    respond_with(@category)
  end

  def destroy
    @category.destroy
    respond_with(@category)
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :post_id)
    end
end
