class Goal < ActiveRecord::Base
  COLORS = ['cyan', 'magenta', 'orange', 'green', 'yellow']

  validates_presence_of :name
  validates :color, inclusion: COLORS

  has_many  :goal_taggings,
            dependent: :destroy

  has_many  :action_items,
            through: :goal_taggings,
            source: 'taggable',
            source_type: 'ActionItem'

  has_many  :metrics,
            through: :goal_taggings,
            source: 'taggable',
            source_type: 'Metric'

end