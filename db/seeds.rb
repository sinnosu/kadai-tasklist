# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Task.create(content: 'test content 1', status: 'test status 1')
(1..100).each do |num|
  Task.create(content: 'test content '+ num.to_s, status: 'test status '+ num.to_s)
end