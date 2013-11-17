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
    @category = Category.create(title: params[:category][:title])
    redirect_to @category
  end

  def edit

  end

  def update

  end

  def destroy

  end

end
