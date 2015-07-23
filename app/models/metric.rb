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

  def unit_symbol
    case data_unit
    when 'percentage'
      '%'
    when 'dollars'
      '$'
    else data_unit
    end
  end

  def action_items
    ActionItem.joins(:goals).includes(:goals).where("goals.id IN (#{goals.pluck(:id).join(',')})")
  end

  def percent_of_target
    point_1 = data_points.order('data_time ASC').first
    point_2 = data_points.order('data_time ASC').last
    return nil unless [point_1, point_2].all?

    ratio = point_1.value / point_2.value
    (ratio * 100).round
  end
end