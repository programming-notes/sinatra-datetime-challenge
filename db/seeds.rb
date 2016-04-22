def fake_event_name
  "#{Faker::Hacker.ingverb} #{Faker::Hacker.adjective} #{Faker::Hacker.noun.pluralize}".titleize
end

def fake_start_time
  Faker::Time.between(DateTime.now, DateTime.now.advance(days: 20), :afternoon).change(min: [0, 15, 30, 45].sample)
end

def fake_end_time(start_time)
  [start_time.advance(hours: [1, 2, 3].sample, minutes: [0, 30].sample), nil].sample
end

def fake_location
  [Faker::Company.name, Faker::University.name].sample
end


# Remove any events from the database
Event.delete_all

# Create 20 events
20.times do
  start_time = fake_start_time

  Event.create!({
    name: fake_event_name,
    location: fake_location,
    starts_at: start_time,
    ends_at: fake_end_time(start_time)
  })
end
