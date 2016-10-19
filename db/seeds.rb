def fake_event_name
  "#{Faker::Hacker.ingverb} #{Faker::Hacker.adjective} #{Faker::Hacker.noun.pluralize}".titleize
end

def fake_location
  [Faker::Company.name, Faker::University.name].sample
end

def fake_start_time(earliest_date = Date.current.beginning_of_day, latest_date = earliest_date.advance(days: 14).end_of_day)
  Faker::Time.between(earliest_date, latest_date).change(hour: [11, 12, 13, 14].sample, min: [0, 15, 30, 45].sample, sec: 0)
end




# Remove any events from the database
Event.delete_all

# Create 5 past events
5.times do
  Event.create!({
    :name      => fake_event_name,
    :location  => fake_location,
    :starts_at => fake_start_time(14.days.ago.beginning_of_day, 2.days.ago.end_of_day)
  })
end


# Create 3 events for today
3.times do
  Event.create!({
    :name      => fake_event_name,
    :location  => fake_location,
    :starts_at => fake_start_time(Date.current.beginning_of_day, Date.current.end_of_day)
  })
end

# Create 5 future events
5.times do
  Event.create!({
    :name      => fake_event_name,
    :location  => fake_location,
    :starts_at => fake_start_time(2.days.from_now.beginning_of_day)
  })
end
