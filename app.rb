require 'sinatra'

get '/' do 
    erb :index
end

post '/getstarted' do
    @name = params[:name]
    # if @user_name == 
    erb :game
end

post '/result' do

    @player_choice = params[:choice]
    @computer_choice = ["rock", "paper", "scissors"].sample

    case
    when (@player_choice == 'rock' && @computer_choice == 'scissors') ||
        (@player_choice == 'scissors' && @computer_choice == 'paper') ||
        (@player_choice == 'paper' && @computer_choice == 'rock')
    @outcome = "You won!"
    when (@player_choice == 'scissors' && @computer_choice == 'rock') ||
        (@player_choice == 'paper' && @computer_choice == 'scissors') ||
        (@player_choice == 'rock' && @computer_choice == 'paper')
    @outcome = "You lose!"
    else
    @outcome = "Draw!"
    end

    puts @outcome
  
  erb :result
end





