class AnswersController < ApplicationController
  before_filter :authenticate_user!
  before_action :find_answer, only: [:edit, :show, :update, :destroy]
  def index
    @answer = Answer.all
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new position_params
    @answer.cand_id=session[:candid].to_i
    p @answer
    if @answer.save
      redirect_to @answer, notice: "Answer has been created!"
    else
      flash.now[:alert]  = "There was an error when creating your answer"
      render :new
    end
  end

  def show
     @answer = Answer.find(params[:id])
  end

  def edit
  end

  def update
    if @answer.update_attributes position_params
      redirect_to @answer, notice: "Your answer has been updated!"
    else
      flash.now[:alert] = "There was an error updating your answer"
      render :edit
    end
  end

  def destroy
    answer.destroy
    redirect_to answers_path, notice: "Your answer has been deleted."
  end


  private

  def position_params
    params.require(:answer).permit(:body)
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end



end