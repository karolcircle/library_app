class LendingsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]
  before_action :set_lending, only: [:show ]

  # GET /lendings
  # GET /lendings.json
  def index
    @lendings = Lending.all
  end

  # GET /lendings/1
  # GET /lendings/1.json
  def show
  end

  # GET /lendings/new
  def new
    @lending = Lending.new
  end

  # POST /lendings
  # POST /lendings.json
  def create
    @lending = Lending.create(book_id: params[:book], user_id: current_user.id, date_out: Date.today)
    @book =  Book.find(params[:book])
    @book.lend_book
    
    if @lending.save
      redirect_back(fallback_location: root_path)       
    else
      render :new
    end   
  end

  def return_book  
    @lending = Lending.where('book_id =?', params[:id]).last
    @lending.update(date_in: Date.today)
    @book =  Book.find(params[:id])
    @book.return_book
    @lending.save
    redirect_back(fallback_location: root_path)    
  end
    
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lending
      @lending = Lending.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lending_params
      params.require(:lending).permit(:book_id, :user_id, :date_out, :date_in)
    end
end
