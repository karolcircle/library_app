require 'rails_helper'

describe LendingsController do
login_user

  describe "GET new" do
    it "assigns a blank subscription to the view" do
      get :new
      expect(assigns(:lending)).to be_a_new(Lending)
    end
  end

  describe 'GET #show' do
    it "assigns the requested lending to @lending" do     
      lending = FactoryGirl.create(:lending)
      get :show, params: { id: lending }
      expect(assigns(:lending)).to eq lending
    end

    it "renders the :show template" do
      lending = FactoryGirl.create(:lending)
      get :show, params: { id: lending }
      expect(response).to render_template :show
    end
  end

  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    it "assigns a new lending to @lending" do
      get :new
      expect(assigns(:lending)).to be_a_new(Lending)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end  

  describe "POST #create" do
    it "saves the new lending in the database" do
      expect{FactoryGirl.create(:lending)       
       }.to change(Lending, :count) .by(1)
    end
  end 

  describe 'PUT #return_book' do        
    before :each do      
      @lending = create(:lending,
      date_out: Date.parse('2012-01-01'),
      date_in: nil)            
    end

    it "locates the requested @lending" do        
      put :return_book, params: { id: @lending.book_id, lending: attributes_for(:lending)}      
      expect(assigns(:lending)).to eq(@lending)
    end

    it "changes @lending's attributes" do      
      put :return_book, params: { id: @lending.book_id}           
      @lending.reload
      expect(@lending.date_in).to eq(Date.today)
    end    
  end  
end
