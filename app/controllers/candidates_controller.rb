class CandidatesController < ApplicationController
  before_action :find_candidate, only: [ :show, :edit, :update, :destroy]
  def index
    @candidates = Candidate.all
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new candidate_params
    if @candidate.save
      redirect_to @candidate
    else
      flash.now[:alert]  = "There was a problem creating your candidate"
      render :new
    end  
  end

  def show

  end

  def destroy
    @candidate.destroy
    redirect_to candidates_path, notice: "Your candidate has been deleted."
  end

  def edit
  end

  def update
    if @candidate.update_attributes candidate_params
      redirect_to candidates_path, message: "Your candidate has been updated"
    else
      flash.now[:alert] = "There was a problem updating your candidate"
      render :edit
    end
  end


  private

    def candidate_params
      params.require(:candidate).permit(:first_name, :last_name, :email, :address, :phone, :notes, :position_id, :avatar)
    end

    def find_candidate
      @candidate = Candidate.find(params[:id])
    end
end
