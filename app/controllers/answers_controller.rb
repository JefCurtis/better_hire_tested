class AnswersController < ApplicationController
  before_action :find_question
  before_action :find_candidate
  before_action :find_answer, only: [:update ]

  def create
    respond_to do |format|
      @answer = @question.answers.new answers_params
      if @answer.save
        format.js { render :create }
        format.html { redirect_to interviews_candidate_path(@candidate) }
      else
        format.js {    
                      render :new }
        format.html{
                      flash.now[:alert] = "Your answer couldn't be saved."
                      render :new 
                    }
      end
    end
  end

  def new
  end

  def update
    if @answer.update_attributes answers_params
    redirect_to interviews_candidate_path(@candidate), message: "your question has been updated"
    else
      flash.now[alert] = "Your answer couldn't be updated."
      render :edit
    end
  end






  private

  def answers_params
    params.require(:answer).permit(:title, :candidate_id, :question_id)
  end

  def find_candidate
    @candidate = Candidate.find(params[:answer][:candidate_id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end
end
