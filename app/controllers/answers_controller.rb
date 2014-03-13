class AnswersController < ApplicationController
  before_action :find_question
  before_action :find_interview
  before_action :find_answer, only: [:update, :edit ]

  def create
    respond_to do |format|
      @answer = @question.answers.new answers_params
      @answer.interview = @interview
      if @answer.save
        format.js { render :create }
        format.html { redirect_to interview_path(@interview) }
      else
        format.js { render :new }
        format.html {
                      flash.now[:alert] = "Your answer couldn't be saved."
                      render :new 
                    }
      end
    end
  end

  def new
  end

  def update
    respond_to do |format|
      if @answer.update_attributes answers_params
      format.js { render :update }
      format.html { redirect_to interview_path(@interview), message: "your question has been updated" }
      else
        format.js { render :edit }
        format.html { render :edit }
      end
    end
  end

  private

  def answers_params
    params.require(:answer).permit(:title, :question_id, :interview_id, :rating)
  end

  def find_interview
    @interview = Interview.find(params[:answer][:interview_id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end
end
