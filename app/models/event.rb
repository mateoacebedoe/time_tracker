class Event < ActiveRecord::Base

  belongs_to :category

  attr_accessible :title, :time_interval, :category_id

  def self.sum_times_of(events)

    sum = 0
    events.each do |event|
      sum += event.time_interval
    end

    return sum
  end

end
