class Job < ActiveRecord::Base
  validates_presence_of :title,
                        :organization,
                        :employment_type

  has_many  :goal_taggings,
            as: :taggable

  has_many  :goals,
            through: :goal_taggings
end