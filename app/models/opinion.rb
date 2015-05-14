class Opinion < ActiveRecord::Base

  belongs_to :user
  belongs_to :bar

  validates :comment, presence: true

  def get_time_value(time)
    minute = 60
    hour = minute * 60
    day = hour * 24
    week = day * 7
    month = day * 30
    year = day * 365

    if time < minute
      time
    elsif time >= minute and time < hour
      time / minute
    elsif time >= hour and time < day
      time / hour
    elsif time >= day and time < week
      time / day
    elsif time >= week and time < month
      time / week
    elsif time >= month and time < year
      time / month
    elsif time >= year
      time / year
    end
  end

  def get_time_unit(time)
    minute = 60
    hour = minute * 60
    day = hour * 24
    week = day * 7
    month = day * 30
    year = day * 365

    if time < minute
      'second'
    elsif time >= minute and time < hour
      'minute'
    elsif time >= hour and time < day
      'hour'
    elsif time >= day and time < week
      'day'
    elsif time >= week and time < month
      'week'
    elsif time >= month and time < year
      'month'
    elsif time >= year
      'year'
    end
  end
end
