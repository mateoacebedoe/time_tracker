class LifePhasesController < ApplicationController
  def create
    name = params[:life_phase][:name]
    year = params[:life_phase]["date(1i)"]
    month = params[:life_phase]["date(2i)"]
    day = params[:life_phase]["date(3i)"]

    date = [year, month, day].join("-")

    @life_phase = LifePhase.create(name: name, date: date)

    if @life_phase.save

    end
    redirect_to(:back)
  end
end