class Positions::CandidatesController < ApplicationController

  def index
    @position = Position.find(params[:position_id])
  end
end