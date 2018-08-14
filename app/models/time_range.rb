class TimeRange
  include ActiveModel::Model

  attr_accessor :start_at, :end_at

  validates :start_at, presence: true
  validates :end_at, presence: true

  def initialize(start_at, end_at)
    @start_at = start_at
    @end_at = end_at
  end

  def hour_options
    options = {}
    (start_at.hour..end_at.hour).each do |i|
      options["%02d" % i] = i
    end
    options
  end

  def to_string
    start_at.strftime("%H:%M") + " 〜 " + end_at.strftime("%H:%M")
  end
end