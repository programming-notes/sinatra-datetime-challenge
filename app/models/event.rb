class Event < ActiveRecord::Base
  validates :name, presence: { message: "An event must have a name." }
  validates :location, presence: { message: "An event must have a location." }
  validates :starts_at, presence: { message: "An event must have a properly formatted starting date and time." }

  def self.todays_events
    starts_within(today.beginning_of_day, today.end_of_day)
  end

  def self.not_passed
    where("starts_at >= ?", today)
  end

  def self.starts_within(earliest_time, latest_time)
    where(starts_at: earliest_time..latest_time)
  end

  private
  def self.today
    Date.current
  end
end
