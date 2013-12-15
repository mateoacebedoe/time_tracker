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

  def total_time_spent(time_period = "Beginning of Time")
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

  def full_bread_crumb_trail_html
    if parent_id == 0
      return bread_crumb_html
    else
      return parent.full_bread_crumb_trail_html + bread_crumb_html
    end
  end

  ##returns an array containing the ancestry of this category example: [great_grand_parent, grand_parent, parent]
  def ancestry
    if parent_id == 0
      return []
    else
      return [parent.ancestry, parent].flatten!
    end
  end

  private

  def bread_crumb_html
    return '<li><a class="bread" href="#">' + title + '</a>&nbsp / &nbsp</li>'
  end

  def events_for(time_period)

    if time_period == "Month"
      puts "month"
      events_array = events_for_last_30_days
    elsif time_period == "Week"
      puts "week"

      events_array = events_for_last_7_days
    elsif time_period == "6 Months"
      puts "6months"

      events_array = events_for_last_6_months
    elsif time_period == "Year"
      puts "year"

      events_array = events_for_last_year
    else
      puts "beg of time"
      events_array = events
    end
    return events_array
  end

end

