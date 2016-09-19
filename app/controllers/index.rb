get "/" do
  @events = Event.order(:starts_at)
  @event = Event.new

  erb :index
end
