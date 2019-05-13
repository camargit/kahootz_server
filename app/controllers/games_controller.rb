class GamesController < ApplicationController
  def show
    game = Game.find_by :id => params[:id]

    render :json => game.to_json(:include => :players )

  end

  # post request here to get a new game code
  def new_game_code 
    if params[:new_game] == true
      game = Game.new 
      game.save
    end
  end

    # GET request here to return the code to the client
    def game_details
      new_game = Game.last

      render :json => new_game.to_json( :include => :players )
    end
end