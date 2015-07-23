class DataPoint < ActiveRecord::Base
  validates_presence_of :value,
                        :metric,
                        :data_time

  belongs_to :metric

  public

  def value_with_units
    "#{standardized_value} #{metric.unit_symbol}"
  end

  def standardized_value
    if unit_type == 'percentage' && value > 0 && value <= 1
      return (value * 100).round
    end
    value.round
  end

  def unit_type
    metric.data_unit
  end

  def percent_of_target
    target = self.metric.data_points.order('data_time DESC').first
    return nil unless target
    return (100 * value / target.value).round
  end
end