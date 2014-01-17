class TimeInterval < ActiveRecord::Base

  has_many :events

  attr_accessible :name, :id

  def interval
    return name
  end

  def to_hours
    case format
      when :hours_and_mins
        return hours_and_mins_format_to_hours
      when :mins
        return mins_format_to_hours
      when :hours
        return hours_format_to_hours
    end
  end

  private

  def format
    interval_array = self.interval.split(" ")
    if interval_array.length == 4 #format == "1 hr 30 mins"
      return :hours_and_mins
    elsif interval_array.length == 2
      if interval_array.last == "mins" #format == "30 mins"
        return :mins
      else #format == "2 hrs"
        return :hours
      end
    end
  end

  def hours_and_mins_format_to_hours
    array = interval.split(" ")
    hours = array[0].to_i
    mins = array[2].to_i

    return hours + TimeInterval.mins_to_hours(mins)
  end

  def mins_format_to_hours
    mins = interval.split(" ").first.to_i
    return TimeInterval.mins_to_hours(mins)
  end

  def hours_format_to_hours
    return interval.split(" ").first.to_i
  end

  def self.mins_to_hours(mins)
    return mins/60.0
  end
end