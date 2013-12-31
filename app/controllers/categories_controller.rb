class CategoriesController < ApplicationController
#this is a test commit to check if pushing and pulling works on my windows machine
  def index
    @category = Category.find(1)
  end

  def data
    @category = Category.find_by_title(params[:category_name])
    time_period = params[:time_period]

    puts "==============category============="
    puts params[:category_name]
    puts "==============category============="


    full_data = Hash.new()
    pie_data = Array.new()
    @category.children.each_with_index do |child, i|
      children_info = Hash.new()
      children_info[:label] = child.title
      children_info[:data] = child.total_time_spent(time_period)
      pie_data << children_info
    end

    category_general_data = {
      :time => @category.total_time_spent(time_period),
      :ancestry_titles => @category.ancestry.map { |category| category.title}
    }

    full_data[:pie_data] = pie_data
    full_data[:category_general_data] = category_general_data

    render json: full_data
  end

  def create
    @category = Category.create(title: params[:category][:title], parent_id: params[:parent_id])
    redirect_to category_path(params[:parent_id])
  end

end
