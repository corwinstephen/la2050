class Job < ActiveRecord::Base
  validates_presence_of :title,
                        :employment_type

  has_many  :goal_taggings,
            as: :taggable

  has_many  :goals,
            through: :goal_taggings

  has_and_belongs_to_many :organizations
end