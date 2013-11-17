class Category < ActiveRecord::Base
  has_many :events

  attr_accessible :title, :parent_id, :id

  def parent
    return Category.find(parent_id)
  end

  def children
    return Category.where("parent_id = ?", id)
  end

  #def total_time_spent(category_id)
  #  time_spent = events.time
  #      total_time_spent(children_id)
  #end

end
