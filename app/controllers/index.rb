
#home
get '/' do
  # Look in app/views/index.erb
  erb :index
end

#signup
get '/user/new' do

  #redirect
end

#login
post '/users/:id' do

  redirect to 'users/:id/decks'
end

# view all decks / stats /
# see feedback for all and last round
get '/users/:id/decks' do


end

# logout
post 'users/:id/logout' do

  redirect to '/'
end

#start game
get 'users/:id./round/:round_id' do

end

#make guess
post 'users/:id/round/:round_id/:card_id' do

end

#diplay cards
get 'users/:id/round/:round_id/:card_id' do

end

#quit game
post 'users/:id/round/:round_id/:card_id' do

 redirect to '/users/:id/decks'
end
