class DataPoint < ActiveRecord::Base
  validates_presence_of :value,
                        :metric,
                        :data_time

  belongs_to :metric

  public

  def percent_of_target
    target = self.metric.data_points.order('data_time DESC').first
    return nil unless target
    return (100 * value / target.value).round
  end
end