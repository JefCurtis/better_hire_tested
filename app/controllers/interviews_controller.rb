class InterviewsController < ApplicationController
  before_action :find_interview, only: [ :show ]

  def index
    @interviews = Interview.all
  end

  def new
    @interview = Interview.new
  end

  def show
    @questions_complete = []
    @questions_incomplete = []
    @interview.position.questions.each do |question|
      if @interview.answers.where( question: question ).present?
        @questions_complete << question
      else
        @questions_incomplete << question
      end
    end
    
  end

  def create  
    @interview = Interview.new interview_params
    if @interview.save
      redirect_to interviews_path, message: "Your interview for #{@interview.candidate.formatted_name} has been created"
    else
      render :new
    end
  end



  private

  def interview_params
    params.require(:interview).permit(:position_id, :candidate_id)
  end

  def find_interview
    @interview = Interview.find(params[:id])
  end
end