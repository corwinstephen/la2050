class Metric < ActiveRecord::Base
  validates_presence_of :name

  has_many  :goal_taggings,
            as: :taggable

  has_many  :goals,
            through: :goal_taggings
end