# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(title: "Root", parent_id: 0)
Category.create(title: "Exercise", parent_id: 1)
Category.create(title: "Self Development", parent_id: 1)
Category.create(title: "Soccer", parent_id: 2)

Event.create(title: "Soccer", time_interval: 60, category_id: 4, description: "")
Event.create(title: "Soccer", time_interval: 60, category_id: 4, description: "some footy")
Event.create(title: "Auto Suggestion", time_interval: 60, category_id: 3, description: "whatever")


Event.create(title: "tennis", time_interval: 40, category_id: 2, description: "")



