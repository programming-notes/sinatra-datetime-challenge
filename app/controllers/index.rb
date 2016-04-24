get "/" do
  @events = Event.todays_events
  @event = Event.new

  erb :index
end
