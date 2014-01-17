
class Event < ActiveRecord::Base

  belongs_to :category
  belongs_to :time_interval

  attr_accessible :time_interval_id, :category_id, :description, :created_at, :time_interval
  attr_reader :category_tokens, :time_interval_tokens

  scope :events_for_month, ->(category_id) { where("created_at > ? AND category_id = ?", (Date.today - 1.month), category_id) }
  scope :events_for_6_months, ->(category_id) { where("created_at > ? AND category_id = ?", (Date.today - 6.months), category_id) }
  scope :events_for_week, ->(category_id) { where("created_at > ? AND category_id = ?", (Date.today - 7.days), category_id) }
  scope :events_for_year, ->(category_id) { where("created_at > ? AND category_id = ?", (Date.today - 12.months), category_id) }

  def self.sum_times_of(events)

    sum = 0
    events.each do |event|
      sum += TimeInterval.find(event.time_interval_id).to_hours
    end

    return sum
  end

end
