require "spec_helper"

describe CandidatesController do
  let(:user) { FactoryGirl.create(:user) }
  let(:candidate) { FactoryGirl.create(:candidate) }
  before do
    sign_in user
  end
  describe "GET #index" do
    it "should be successful" do
      get "index"
      expect(response).to be_success
    end
    it "should assign @candidates" do
      candidate = create :candidate
      get :index
    expect(assigns(:candidates)).to eq([candidate])
    end
  end

  describe "GET #new" do
    it "should be successful" do
      get "new"
      expect(response).to be_success
    end
    it "should assign @candidate" do
      get "new"
      expect(assigns[:candidate]).to be_new_record 
    end

  end

  describe "POST #create" do
    
    describe "when a candidate is valid" do
      let(:valid_candidate_params) do
         { candidate: { 
                        first_name: "Bob", 
                        last_name: "Smith",
                        email: "bobsmith@example.com",
                        address: "45 5th Ave Burnaby BC",
                        phone: "604-555-5555"
                      }
          }
      end
      it "should save the candidate" do
        post "create", valid_candidate_params
        expect(Candidate.count).to eq(1)
      end

      it "should redirect to the show page" do
        post "create", valid_candidate_params
        expect(response).to redirect_to(assigns(:candidate))
      end
    end

    describe "when a candidate is invalid" do
      let(:invalid_candidate_params) { { candidate: { first_name: "", last_name: "", email: "", address: "", phone: "" }}}
      it "should set flash error" do
        post "create", invalid_candidate_params
        expect(flash[:alert]).to eq("There was a problem creating your candidate")
      end
      it "should render new" do
        post "create", invalid_candidate_params
        expect(response).to render_template("new")
      end

      it "should not save the candidate" do
        post "create", invalid_candidate_params
        expect(Candidate.count).to eq(0)
      end
    end
  end

  describe "GET #show" do
    it "should assign the candidate to the params[:candidate]" do
      get "show", id: candidate.id
      expect(assigns[:candidate]).to eq(candidate)
    end
  end

  describe "GET #edit" do
    it "should render :edit" do
      get :edit, id: candidate.id
      expect(response).to render_template(:edit)
    end
    it "should assign @candidate" do
      get :edit, id: candidate.id
      expect(assigns[:candidate]).to eq(candidate)
    end
  end

  describe "PUT #update" do
    let(:valid_candidate_params) { {first_name: "Jeremy", email: "jeremy@email.com" } }
    it "should update successfully" do
      candidate = create :candidate
      put :update, id: candidate.id, candidate: valid_candidate_params
      expect(assigns[:candidate][:first_name]).to eq("Jeremy")
    end

    it "should not update when name is nil" do
      candidate = create :candidate
      put :update, id: candidate.id, candidate: { first_name: nil }
      expect(flash[:alert]).to eq("There was a problem updating your candidate")
    end
    it "should not update when name is blank" do
      candidate = create :candidate
      put :update, id: candidate.id, candidate: { first_name: "" }
      expect(flash[:alert]).to eq("There was a problem updating your candidate")
    end
    it "should not update when email is nil" do
      candidate = create :candidate
      put :update, id: candidate.id, candidate: { email: nil }
      expect(flash[:alert]).to eq("There was a problem updating your candidate")
    end
    it "should not update when the email already exists" do
      candidate1 = create :candidate, email: "bob@example.com"
      candidate2 = create :candidate, email: "joe@example.com"
      dup_email_params = { email: "bob@example.com" }
      put :update, id: candidate2.id, candidate: dup_email_params
      expect(flash[:alert]).to eq("There was a problem updating your candidate")  
    end
    it "should update position_id when position added" do
      position = create :position
      candidate = create :candidate
      put :update, id: candidate.id, candidate: { position_id: position.id }
    end

  end
  describe "DELETE #destroy" do
    it "should delete successfully" do
      candidate = create :candidate
      delete :destroy, id: candidate.id
      expect(Candidate.count).to eq(0)
    end
  end

end

