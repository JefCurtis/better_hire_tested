class QuestionsController < ApplicationController
  before_action :find_position
  before_action :find_question, only: [ :edit, :destroy, :update ]

  def create
    @question = @position.questions.new question_params
    if @question.save
      redirect_to @position, notice: "Your question has been added."
    else
      flash.now[:alert] = "There was an error trying to create your question"
      render "new" 
    end
  end

  def update
    if @question.update_attributes(question_params)
      redirect_to @position, notice: "Your question has been updated"
    else
      flash.now[:alert] = "There was an error editing your question"
      render :edit
    end
  end

  def new
    @question = Question.new
  end

  def edit 
  end

  def destroy
    @question.destroy
    redirect_to @position, notice: "Your question was deleted"
  end


  private

  def question_params
    params.require(:question).permit(:title)
  end

  def find_position
    @position = Position.find(params[:position_id])
  end

  def find_question
    @question = @position.questions.find(params[:id])
  end
end    

