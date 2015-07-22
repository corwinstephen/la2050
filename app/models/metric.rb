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

  def percent_of_target
    point = data_points.where('data_time < ?', Date.new(2050)).order('data_time DESC').first
    return nil unless point.present?

    if point.value > 0 && point.value < 1
      return (point.value * 100).round
    end      
  end
end