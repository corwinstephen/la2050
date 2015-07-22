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

# Generate grantees
file = Rails.root.join("db", "seed_files", "grantees.csv")
CSV.foreach(file, headers: true) do |row|
  attrs = {
    project_name: row['Project'],
    year: row['Year Awarded'],
    description: row['Description'],
    action_url: row[''],
    website_url: row['Website'],
    submission_url: row['Original Submission Link'],
    instagram: row['Instagram'],
    twitter: row['Twitter'],
    facebook: row['Facebook'],
    video_url: row['Video url']
  }

  grantee = Grantee.create(attrs)
  goal = Goal.find_by_name(row['Goal'].try(:downcase))

  # Try to find a matching organization
  org = Organization.find_by_name(row['Organization(s)'])
  grantee.organizations << org unless org.nil?
  grantee.goals << goal unless goal.nil?

end

# Generate metrics
file = Rails.root.join("db", "seed_files", "metrics.csv")
CSV.foreach(file, headers: true) do |row|
  dream = row['dream'] == "x" ? true : false
  attrs = {
    name: row['name'],
    description: row['description'],
    target_description: row['target_description'],
    dream: dream
  }

  metric = Metric.create(attrs)

  # match and add goal
  goal = Goal.find_by_name(row['goal'].try(:downcase))
  metric.goals << goal unless goal.nil?
end

# Generate jobs
file = Rails.root.join("db", "seed_files", "jobs.csv")
CSV.foreach(file, headers: true) do |row|
  attrs = {
    title: row['title'],
    employment_type: row['type'],
    location: row['location'],
    description: row['description'],
    to_apply: row['to_apply'],
    # date_posted: DateTime.strptime(row['date_posted'], "%m/%d/%Y")
  }

  job = Job.create(attrs)

  # Try to find a matching organization
  org = Organization.find_by_name(row['organization'])
  job.organizations << org unless org.nil?

  # match and add goal
  goal = Goal.find_by_name(row['goal'].try(:downcase))
  job.goals << goal unless goal.nil?
end