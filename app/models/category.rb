class Category < ActiveRecord::Base
  has_many :events

  attr_accessible :title, :parent_id, :id

  def parent
    return Category.find(parent_id)
  end

  def children
    return Category.where("parent_id = ?", id)
  end

  def has_children?
    return !children.empty?
  end

  def total_time_spent(time_period = "beginning of time")

    puts "###########"
    puts time_period

    events_array = events_for(time_period)
    time_spent = Event.sum_times_of(events_array)

    if has_children?
      children.each do |child|
        time_spent += child.total_time_spent(time_period)
      end
    end

    return time_spent
  end

  def events_for_last_30_days
    Event.events_for_month(self)
  end

  def events_for_last_7_days
    Event.events_for_week(self)
  end

  def events_for_last_6_months
    Event.events_for_6_months(self)
  end

  def events_for_last_year
    Event.events_for_6_months(self)
  end

  private

  def events_for(time_period)
    puts "####################"
    puts "IN"
    if time_period == "month"
      puts "####################"
      puts "month"
      events_array = events_for_last_30_days
    elsif time_period == "week"
      puts "####################"
      puts "week"
      events_array = events_for_last_7_days
    elsif time_period == "6 months"
      puts "####################"
      puts "6 monnths"
      events_array = events_for_last_6_months
    elsif time_period == "year"
      puts "####################"
      puts "year"
      events_array = events_for_last_year
    else
      puts "####################"
      puts "beg of time"
      events_array = events
    end
    puts "####################"
    puts "OUT"
    return events_array
  end

end

