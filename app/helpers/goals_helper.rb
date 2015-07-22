module GoalsHelper
  def color_for_goal(goal_name)
    goal = Goal.find_by_name(goal_name)
    return nil unless goal.present?
    return goal.color
  end
end