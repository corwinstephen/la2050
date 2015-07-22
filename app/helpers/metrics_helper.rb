module MetricsHelper
  def metrics_from_params
    if params[:goal].present?
      Metric.includes(:goals).joins(:goals).where("goals.name = ?", params[:goal])
    else
      Metric.all
    end
  end
end