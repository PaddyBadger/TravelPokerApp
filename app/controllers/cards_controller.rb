class CardsController < ApplicationController

  def index
    @cards = Card.paginate(page: params[:page], per_page: 12)
  end

  def show
     @card = Card.find(params[:id])
     @comments = @card.comments.includes(:user)
     @json = @card.to_gmaps4rails
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(params[:card])
    
    if @card.save
      flash[:notice] = "card was saved."
      redirect_to @card
    else
      flash[:error] = "There was an error saving the card. Please try again."
      render :new 
    end
  end

  def update
    @card = Card.find(params[:id])
    
      if @card.update_attributes(params[:card])
        flash[:notice] = "card was updated."
        redirect_to @card, notice: "card was saved successfully."
      else
        flash[:error] = "There was an error saving the card. Please try again."
        render :edit
      end
  end

  def edit
    @card = Card.find(params[:id])
  end

  def destroy
    @card = Card.find(params[:id])
    title = @card.title
     
    if @card.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to cards_path
    else
      flash[:error] = "There was an error deleting the card."
      render :show
    end
  end

end
