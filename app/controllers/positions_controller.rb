class PositionsController < ApplicationController
  before_filter :authenticate_user!
  before_action :find_position, only: [:edit, :show, :update, :destroy]
  def index
    @positions = Position.all
  end

  def new
    @position = Position.new
  end

  def create
    @position = Position.new position_params
    if @position.save
      redirect_to @position, notice: "#{@position.name} position has been created!"
    else
      flash.now[:alert]  = "There was an error when creating your job position"
      render :new
    end
  end

  def show
    # @question = @position.questions.new
    # @question.save

  end

  def edit
  end

  def update
    if @position.update_attributes position_params
      redirect_to @position, notice: "Your job position has been updated!"
    else
      flash.now[:alert] = "There was an error updating your job position"
      render :edit
    end
  end

  def destroy
    @position.destroy 
    redirect_to positions_path, notice: "Your job position has been deleted."
  end


  private 

  def position_params
    params.require(:position).permit(:name, :description)
  end

  def find_position
    @position = Position.find(params[:id])
  end



end