# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Generate goals
[['live', 'green'], ['create', 'yellow'], ['play', 'magenta'], ['learn', 'cyan'], ['connect', 'red']].each do |goal_params|
  Goal.create(name: goal_params[0], color: goal_params[1])  
end

# Genrate Organizations
file = Rails.root.join("db", "seed_files", "organizations.csv")
CSV.foreach(file, headers: true) do |row|
 attrs = {
   name: row['name']
 }

 Organization.create(attrs)
end