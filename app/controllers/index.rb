
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
  if User.where(params)
    session[:user_id] = User.where(params)
  else
    @status = 'not_logged_in'
  end
  redirect '/'
end

# view all decks / stats /
# see feedback for last round
get '/users/decks' do


  erb :index
end

get '/users/stats' do

  erb :full_stats
end


# logout
get '/users/logout' do
  logout
     # "Thank You" message
  redirect '/'
end

#start game
post '/users/round' do
  start_round(params[:deck_id])
  @round_cards = Round.starting_deck
  redirect '/users/round/:card_id'
end

# move :card_id to session
#make guess
post '/users/round/:card_id' do
  # if #correct
  #   #success!
  # else #incorrect
  #   #failure.
  # end
  erb :game
end

#diplay cards
get 'users/round/:card_id' do
  erb :game
end

#quit game
post 'users/round/:card_id' do
  redirect to '/users/decks'
end
