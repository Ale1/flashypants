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

get '/users/round/:status' do
  if params[:status] == "new"
    @round_cards = starting_deck
  else
    if params[:status] == "correct"
      @message = correct_answer
    elsif params[:status] == "incorrect"
      @message = incorrect_answer
    end
    @round_cards = unsolved_cards
  end

  @card = @round_cards.sample
  erb :game
end

#the entire game!
post '/users/round/:state_or_id' do
  if params[:state_or_id] == 'new'
    start_round(params[:deck_id])
    @status = "new"
  # elsif params[:state_or_id] == 'resume'
  #   @status = "resume"
  elsif params[:answer].downcase == params[:expected].downcase
    @status = "correct"
    increment_score
    increment_attempts
    solve(params[:state_or_id])
  else
    @status = "incorrect"
    increment_attempts
  end

  redirect "/users/round/#{@status}"
end

get '/users/round/:card_id/show' do
  card = return_card(params[:card_id])
  give_up(card.id)
  increment_attempts
  @solution = card.answer
  erb :game
end

