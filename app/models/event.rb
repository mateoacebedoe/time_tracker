class Event < ActiveRecord::Base

  bolongs_to :category

  attr_accessible :title, :time_interval


end
