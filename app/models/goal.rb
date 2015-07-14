class Goal < ActiveRecord::Base
  validates_presence_of :name

  has_many  :goal_taggings
end