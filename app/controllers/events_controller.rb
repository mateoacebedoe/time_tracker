class EventsController < ApplicationController

  def index
    @time_of_last_logged_event = Event.last.created_at.strftime("%l:%M %p") unless !Event.last
    @category = Category.new
    @event = Event.new
  end

  def create
    time_interval = TimeInterval.find(params[:event][:time_interval_id])
    description = params[:event][:description]
    parents_ids = params[:event][:category_id].split(",")
    parents_ids.each do |parent_id|
      Event.create!(time_interval: time_interval, description: description, category_id: parent_id)
    end
    redirect_to(:back)
  end

  def time_intervals
    @time_intervals = TimeInterval.where("name like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.html
      format.json {render :json => @time_intervals }
    end
  end

end