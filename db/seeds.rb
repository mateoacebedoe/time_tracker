# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(name: "Root", parent_id: 0) #category_id == 1
Category.create(name: "Exercise", parent_id: 1) #category_id == 2
Category.create(name: "Self Development", parent_id: 1) #category_id == 3
Category.create(name: "Soccer", parent_id: 2) #category_id == 4
Category.create(name: "late afternoon", parent_id: 4) #category_id == 5


event1 = Event.create(time_interval: 60, category_id: 4, description: "")
event1.created_at = 1.years.ago
event1.save!
event2 = Event.create(time_interval: 60, category_id: 4, description: "some footy")
event2.created_at = 5.months.ago
event2.save!

event3 = Event.create(time_interval: 60, category_id: 3, description: "whatever")
event3.created_at = 2.weeks.ago
event3.save!

Event.create(time_interval: 40, category_id: 2, description: "")
Event.create(time_interval: 60, category_id: 5, description: "")
Event.create(time_interval: 40, category_id: 5, description: "")




