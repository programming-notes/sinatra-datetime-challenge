get "/events" do
  @events = Event.not_passed.order(:starts_at)

  erb :"events/index"
end

get '/events/new' do
  @event = Event.new

  erb :"events/new"
end

post '/events' do
  puts params[:event]
  @event = Event.new(params[:event])

  if @event.save
    redirect "/events"
  else
    erb :"events/new"
  end
end
