require 'rails_helper'

describe BooksController do
login_user

  describe 'GET #show' do
    it "assigns the requested book to @book" do    
      book = FactoryGirl.create(:book)
      get :show, params: { id: book }
      expect(assigns(:book)).to eq book
    end

    it "renders the :show template" do
      book = FactoryGirl.create(:book)
      get :show, params: { id: book }
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
    it "assigns a new Book to @book" do
      get :new
      expect(assigns(:book)).to be_a_new(Book)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested book to @book" do
      book = FactoryGirl.create(:book)     
      get :edit, params: { id: book }
      expect(assigns(:book)).to eq book
    end

    it "renders the :edit template" do
      book = FactoryGirl.create(:book)
      get :edit, params: { id: book }
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    it "saves the new book in the database" do
      expect{FactoryGirl.create(:book)       
       }.to change(Book, :count) .by(1)
    end
  end 

  describe 'PATCH #update' do    
    
    before :each do
      @book = create(:book,
      title: 'Lawrence',
      author: 'Smith')
    end

    it "locates the requested @book" do      
      patch :update, params: { id: @book, book: attributes_for(:book) }
      expect(assigns(:book)).to eq(@book)
    end

    it "changes @book's attributes" do     
      patch :update, params: { id: @book,
      book: attributes_for(:book,
      title: 'Larry',
      author: 'Smith')}
      @book.reload
      expect(@book.title).to eq('Larry')
      expect(@book.author).to eq('Smith')
    end

    it "redirects to the updated book" do      
      patch :update, params: { id: @book, book: attributes_for(:book) }
      expect(response).to redirect_to @book
    end
  end   

  describe 'DELETE #destroy' do
    
    before :each do
      @book = create(:book)
    end

    it "deletes the book" do
      expect{      
      delete :destroy, params: { id: @book }
      }.to change(Book,:count).by(-1)
    end

    it "redirects to books#index" do      
      delete :destroy, params: { id: @book }
      expect(response).to redirect_to books_url
    end
  end
end
