class Metric < ActiveRecord::Base
  validates_presence_of :name
  validates :dream, inclusion: { in: [true, false] }

  has_many  :goal_taggings,
            as: :taggable

  has_many  :goals,
            through: :goal_taggings

  has_many  :data_points

  public

  # Right now metrics can only 
  # have one goal.
  def goal_name
    if (goal = goals.first)
      goal.name
    else
      "No goal"
    end
  end

  def action_items
    ActionItem.joins(:goals).includes(:goals).where("goals.id IN (#{goals.pluck(:id).join(',')})")
  end
end