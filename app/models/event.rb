class Event < ActiveRecord::Base
  def self.todays_events
    starts_within(today.beginning_of_day, today.end_of_day)
  end

  def self.starts_within(earliest_time, latest_time)
    where(starts_at: earliest_time..latest_time)
  end

  private
  def self.today
    Date.current
  end
end
