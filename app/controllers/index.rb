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
  if User.where(params).count > 0
    login(User.where(params).first)
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


#the entire game!
post '/users/round/:card_id' do
  if params[:card_id] == 'new'
    start_round(params[:deck_id])
    @round_cards = starting_deck
  elsif unsolved_cards.compact.empty?
    redirect to '/users/stats' 
    # Have fun, Alejandro! Let's drop users
    # off on the stats page, show them their
    # stats (for the round and all-time), and
    # set the value of session[:round] to nil!
  else 
    if params[:answer].downcase == params[:expected].downcase
      @message = correct_answer
      solve(params[:card_id])
    else
      @message = incorrect_answer
    end
    @round_cards = unsolved_cards
  end
  @card = @round_cards.sample
  erb :game
end

post 'users/round/:card_id/show' do
  @card = return_card(params[:card_id])
  @solution = @card.answer
  erb :game
end

