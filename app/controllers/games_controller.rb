class GamesController < ApplicationController

  skip_before_action :only_signed_in, only: [:index, :show]
  
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end
end
