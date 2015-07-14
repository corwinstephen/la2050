class GoalTagging < ActiveRecord::Base
  belongs_to :goal
  belongs_to :taggable,
              polymorphic: true
end