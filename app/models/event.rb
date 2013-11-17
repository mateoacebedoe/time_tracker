class Event < ActiveRecord::Base

  belongs_to :category

  attr_accessible :title, :time_interval, :category_id


end
