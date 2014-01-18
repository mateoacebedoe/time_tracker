class CategoriesController < ApplicationController

  def index
    @categories = Category.where("name like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.html
      format.json {render :json => @categories }
    end
  end

  def analyze
  end

  def pie_data
    @category = Category.find_by_name(params[:category_name])
    time_period = params[:time_period]

    category_general_data = {
      :time => @category.total_time_spent(time_period),
      :ancestry_titles => @category.ancestry.map { |category| category.name}
    }

    full_data = Hash.new()
    full_data[:pie_data] = @category.children_with_times(time_period)
    full_data[:category_general_data] = category_general_data

    render json: full_data
  end

  def create
    @category = Category.create!(name: params[:category][:name], parent_id: params[:category][:parent_id])
    redirect_to(:back)
  end

  def titles
    titles = Category.titles
    render json: titles
  end

end
