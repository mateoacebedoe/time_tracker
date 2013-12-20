class EventsController < ApplicationController

  def create
    puts params[:event][:time_interval].inspect

    title = params[:event][:title]
    time_interval = params[:event][:time_interval]
    category_id = params[:category_id]
    description = params[:event][:description]

    @event = Event.new(title: title, time_interval: time_interval, category_id: category_id, description: description)

    if @event.save
      flash[:notice] = "Successfully added the event"
    else
      flash[:error] = "Failed to add the event"
    end

    redirect_to category_path(params[:category_id])
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def in_database
    event_titles_array = []
    Event.uniq.pluck(:title).each do |event_title|
      event_titles_array << event_title
    end

    render json: event_titles_array
  end

end