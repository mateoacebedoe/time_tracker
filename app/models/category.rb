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

  def total_time_spent

    time_spent = Event.sum_times_of(events)

    if has_children?
      children.each do |child|
        time_spent += child.total_time_spent
      end
    end

    return time_spent
  end

end
