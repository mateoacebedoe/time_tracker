class CategoriesController < ApplicationController

  def index
    @category = Category.find(1)
    redirect_to @category
  end

  def new

  end

  def show
    @category = Category.where(id: params[:id]).first
  end

  def create
    @category = Category.create(title: params[:category][:title], parent_id: params[:parent_id])
    redirect_to category_path(params[:parent_id])
  end

  def edit

  end

  def update

  end

  def destroy

  end

end
