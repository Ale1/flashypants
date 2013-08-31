
#home
get '/' do
  # Look in app/views/index.erb
  erb :index
end

#signup
get '/user/new' do

  erb :sign_up
end

#login
post '/users/:id' do
 if authentication successful
    redirect to 'users/:id/decks'
 else
    render erb :index #w/ error message
end

# view all decks / stats /
# see feedback for last round
get '/users/:id/decks' do

  erb :index
end

get 'users/:id/stats' do

  erb :full_stats
end


# logout
post 'users/:id/logout' do
   #close session
   # "Thank You" message

  redirect to '/'
end

#start game
get 'users/:id./round/:round_id' do
  erb :game
end

#make guess
post 'users/:id/round/:round_id/:card_id' do

  erb :game
end

#diplay cards
get 'users/:id/round/:round_id/:card_id' do
  erb :game
end

#quit game
post 'users/:id/round/:round_id/:card_id' do

  redirect to '/users/:id/decks'
  erb:index
end
