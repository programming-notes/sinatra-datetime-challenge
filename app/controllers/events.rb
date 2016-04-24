get "/events" do
  @events = Event.order(:starts_at)

  erb :"events/index"
end
