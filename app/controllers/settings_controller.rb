class SettingsController < ApplicationController

  def index
    @category = Category.new
    @last_event = Event.last
    puts "#########last#########"
    puts @last_event.inspect
    puts "#########last#########"

    @life_phase = LifePhase.new
  end

end