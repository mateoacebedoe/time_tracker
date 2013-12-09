class CategoriesController < ApplicationController

  def index
    @category = Category.find(1)
  end

  def data
    @category = Category.find_by_title(params[:category_name])
    data = Array.new()

    @category.children.each_with_index do |child, i|
      hash = Hash.new()
      hash[:label] = child.title
      hash[:data] = child.total_time_spent
      data << hash
    end

    data << @category.full_bread_crumb_trail_html

    render json: data
  end

  def create
    @category = Category.create(title: params[:category][:title], parent_id: params[:parent_id])
    redirect_to category_path(params[:parent_id])
  end

end
