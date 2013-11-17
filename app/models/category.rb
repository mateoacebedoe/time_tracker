class Category < ActiveRecord::Base
  has_many :events

  attr_accessible :title, :parent_id
end
