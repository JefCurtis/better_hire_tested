require 'spec_helper'

describe PositionsController do
  let(:user) { FactoryGirl.create(:user) }
  before do
    sign_in user
  end
  
  describe "GET #index" do

    it 'should be successful' do
      get :index
    end

    it 'should assign @positions' do
      position = create :position
      get :index
      expect(assigns(:positions)).to eq([position])
      
    end

    it 'should set a @position for the view' do
      get :new
      expect(assigns[:position]).to be
    end
  end

  describe "POST #create" do
    
    describe "when the position is valid" do
      
      let(:valid_position_params) { {position: {name: "Web Designer", description: 'Someone with a little sense of design!'}} }
      
      it "should create a position" do
        post :create, valid_position_params
        expect(Position.count).to eq(1)
      end
    
      it "should redirect to position#show" do
        post :create, valid_position_params
        new_position = Position.first
        expect(response).to redirect_to(new_position)
      end

      it "should set a flash message" do
        post :create, valid_position_params
        expect(flash[:notice]).to eq('Web Designer position has been created!')
      end
    end

    describe "when the position name is blank" do

      it "should set a flash message" do
        post :create, {position: {name: ""}}
        expect(flash[:alert]).to eq("There was an error when creating your job position")
      end
    end
  end
  
  describe "GET #show" do
    
    it 'should be successful' do
      position = create :position
      get :show, id: position.id
      expect(response).to be_success
    end

    it 'should assign @position' do      
      position = create :position
      get :show, id: position.id
      expect(assigns(:position)).to eq(position)
    end

      it "should display question for position" do
      question = create :question
      position = create :position
      position.questions << question
      get :show,  id: position.id
      expect(response).to render_template('show')
    end

  end

  describe "GET #edit" do

    it "should set @position" do
      position = create :position
      get :edit, id: position.id
      expect(assigns(:position)).to eq(position)
    end
  end

  describe "PATCH #update" do

    let(:valid_position_params) { {position: {name: "Janitor", description: 'Mop Mop Mop, all day long.'}} }

    it "should update the position name" do
      position = create :position
      put :update, id: position.id, position: valid_position_params
      # flash[:notice].should_not be_nil
      expect(response).to redirect_to(action: 'show') 
    end

    it "should re-render the #edit template on invalid attempt" do
      position = create :position
      attr = { name: "", description: "blah" }
      put :update, id: position.id, position: attr
      flash[:alert].should_not be_nil
      expect(response).to render_template('edit') 
    end
  end

  describe "DELETE #delete" do

    it "should delete @position" do
      position = create :position
      delete :destroy, id: position.id
      expect(Position.count) == 0
    end
  end




end