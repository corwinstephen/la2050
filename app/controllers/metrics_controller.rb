class MetricsController < ApplicationController
  def show
    @metric = Metric.find_by_name(params[:id]) || Metric.find(params[:id])
    @action_items = @metric.action_items

    render :cms_layout => 'metric', :cms_blocks => {
      name: @metric.name,
      description: @metric.description,
      goal: @metric.goal_name,
      target_description: @metric.target_description
    }
  end
end