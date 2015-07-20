class MetricsController < ApplicationController
  def show
    render :cms_layout => 'metric', :cms_blocks => {
    }
  end
end