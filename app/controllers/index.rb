
#home
get '/' do
  erb :index
end

#signup
get '/user/new' do

  erb :sign_up
end

#login
post '/users' do
  if logged_in? == false
    redirect to '/'
  else
    redirect to '/users/decks'
  end
end

# view all decks / stats /
# see feedback for last round
get '/users/decks' do


  erb :index
end

get 'users/stats' do

  erb :full_stats
end


# logout
post 'users/logout' do
   #close session
   # "Thank You" message
  redirect to '/'
end

#start game
get 'users/round' do

  @round_cards = Round.starting_deck
  erb :game
end

# move :card_id to session
#make guess
post 'users/round/:card_id' do
  # if #correct
  #   #success!
  # else #incorrect
  #   #failure.
  # end
  erb :game
end

#diplay cards
get 'usersround/:card_id' do
  erb :game
end

#quit game
post 'usersround/:card_id' do
  redirect to '/users/decks'
end
