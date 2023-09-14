require 'sinatra'
enable :sessions  

get '/' do 
    erb :index
end

post '/getstarted' do
    @name = params[:name]
    # if @user_name == 
    @rounds = params[:rounds].to_i
    
    session[:name] = @name
    session[:rounds] = @rounds
    session[:results] = []
    erb :game
end

post '/result' do
    
    @player_choice = params[:choice]
    @computer_choice = ["rock", "paper", "scissors"].sample

    results = check(@player_choice, @computer_choice)
    history = {Player: @player_choice, Computer: @computer_choice, results: @outcome}
    session[:results] << history

    if session[:results].length < session[:rounds]
        erb :game
    else
        record = session[:results].map {|hash| hash[:results]}
        session[:win_count] = record.count("You won!")
        session[:lose_count] = record.count("You lose!")
        session[:draw_count] = record.count("Draw!")

        erb :test
    end
  
end

def check(player, computer)
    case
    when (player == 'rock' && computer == 'scissors') ||
        (player == 'scissors' && computer == 'paper') ||
        (player == 'paper' && computer == 'rock')
    @outcome = "You won!"
    when (player == 'scissors' && computer == 'rock') ||
        (player == 'paper' && computer == 'scissors') ||
        (player == 'rock' && computer == 'paper')
    @outcome = "You lose!"
    else
    @outcome = "Draw!"
    
    end
    puts @outcome
    end
