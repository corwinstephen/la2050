module GoalsHelper
  def color_for_goal
    metric = Metric.find(params[:id])
    goal = metric.goals.first
    return nil unless goal.present?
    return goal.color
  end
end