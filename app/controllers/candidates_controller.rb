class CandidatesController < ApplicationController
  before_action :find_candidate, only: [ :show, :edit, :update ]
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

  def edit
  end

  def update
    if @candidate.update_attributes candidate_params
      redirect_to @candidate, message: "Your candidate has been updated"
    else
      flash.now[:alert] = "There was a problem updating your candidate"
      render :edit
    end
  end

   def destroy
    @candidate.destroy
    redirect_to candidates_path
   end

  private

    def candidate_params
      params.require(:candidate).permit(:first_name, :last_name, :email, :address, :phone, :note, :position_id)
    end

    def find_candidate
      @candidate = Candidate.find(params[:id])
    end
end
