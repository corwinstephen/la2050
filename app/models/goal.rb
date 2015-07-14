class Goal < ActiveRecord::Base
  COLORS = ['cyan', 'magenta', 'red', 'green', 'yellow']

  validates_presence_of :name
  validates :color, inclusion: COLORS

  has_many  :goal_taggings,
            dependent: :destroy
end