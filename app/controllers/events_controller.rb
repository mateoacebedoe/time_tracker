class EventsController < ApplicationController

  def create
    puts params[:event][:time_interval].inspect

    @event = Event.new(title: params[:event][:title], time_interval: params[:event][:time_interval], category_id: params[:category_id])

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

end