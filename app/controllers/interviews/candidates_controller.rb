class Interviews::CandidatesController < ApplicationController

  def index
    @candidates = Candidate.with_template_assigned
  end

  def show
    @candidate = Candidate.find(params[:id])
    @questions_complete = []
    @questions_incomplete = []
    @candidate.position.questions.each do |q|
      if q.answers.where( candidate: @candidate ).count > 0
        @questions_complete << q
      else
        @questions_incomplete << q
      end
    end
  end

def new
  @candidates = Candidate.with_no_template
  @positions = Position.all
end

end