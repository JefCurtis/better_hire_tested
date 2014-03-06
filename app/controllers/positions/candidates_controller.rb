class Positions::CandidatesController < ApplicationController

  def index
    @position = Position.find(params[:position_id])
    @candidates = Candidate.all_but(@position)
  end
end