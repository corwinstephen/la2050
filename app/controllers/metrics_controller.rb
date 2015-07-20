class MetricsController < ApplicationController
  def show
    @metric = Metric.find(params[:id])
    @action_items = @metric.action_items

    render :cms_layout => 'metric', :cms_blocks => {
      name: @metric.name,
      goal: @metric.goal_name
    }
  end
end