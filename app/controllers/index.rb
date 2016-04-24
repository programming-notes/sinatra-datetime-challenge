get "/" do
  @events = Event.todays_events
  erb :index
end
