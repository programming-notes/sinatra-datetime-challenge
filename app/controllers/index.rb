get "/" do
  @events = Event.todays_events.order(:starts_at)
  @event = Event.new

  erb :index
end
