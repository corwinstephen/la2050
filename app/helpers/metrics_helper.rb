module MetricsHelper
  def metrics_from_params
    scope = Metric.joins(:goals).order('goals.name ASC, metrics.name ASC')
    if params[:goal].present?
      scope.includes(:goals).joins(:goals).where("goals.name = ?", params[:goal])
    else
      scope.all
    end
  end
end