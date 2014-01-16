class EventsController < ApplicationController

  def index
    @category = Category.new
    @event = Event.new
  end

  def create
    puts "########################3"
    puts params.inspect
    puts "#############################3"
    time_interval = params[:event][:time_interval]
    description = params[:event][:description]
    parents_ids = params[:event][:category_tokens].split(",")
    parents_ids.each do |parent_id|
      Event.create!(time_interval: time_interval, description: description, category_id: parent_id)
    end
    redirect_to(:back)
  end

end