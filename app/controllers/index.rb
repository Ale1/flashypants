
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
post '/users/round/:card_id' do
  puts params[:card_id]
  if params[:card_id] == 'new'
    start_round(params[:deck_id])
    @round_cards = starting_deck
  else 
    if params[:answer] == params[:expected]
      @message = correct_answer
    else
      @message = incorrect_answer
    end
    @round_cards = params[:@round_cards]
    convert_params_to_card_objects(@round_cards)
  end
  @card = next_card(@round_cards)
  erb :game
end


#quit game
post 'users/round/:card_id' do
  redirect to '/users/decks'
end
