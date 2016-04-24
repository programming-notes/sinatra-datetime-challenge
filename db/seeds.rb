def fake_event_name
  "#{Faker::Hacker.ingverb} #{Faker::Hacker.adjective} #{Faker::Hacker.noun.pluralize}".titleize
end

def fake_location
  [Faker::Company.name, Faker::University.name].sample
end

def fake_start_time(earliest_date = DateTime.now, latest_date = earliest_date.advance(days: 14))
  Faker::Time.between(earliest_date, latest_date, :afternoon).change(min: [0, 15, 30, 45].sample)
end




# Remove any events from the database
Event.delete_all

# Create 3 events for today
3.times do
  Event.create!({
    :name      => fake_event_name,
    :location  => fake_location,
    :starts_at => fake_start_time(Date.current, Date.current.end_of_day)
  })
end

# Create 20 future events
20.times do
  Event.create!({
    :name      => fake_event_name,
    :location  => fake_location,
    :starts_at => fake_start_time(Date.tomorrow)
  })
end
