class DecksController < ApplicationController
  def index
    @decks = Deck.paginate(page: params[:page], per_page: 12)
  end

  def show
     @deck = Deck.find(params[:id])
     @cards = @deck.cards.includes(:user).paginate(page: params[:page], per_page: 12)
  end

  def new
    @deck = Deck.new
    @cards = Card.all
  end

  def create
    @deck = Deck.new(params[:deck])
    
    if @deck.save
      flash[:notice] = "Deck was saved."
      redirect_to @deck
    else
      flash[:error] = "There was an error saving the deck. Please try again."
      render :new 
    end
  end

  def update
    @deck = Deck.find(params[:id])
    
      if @deck.update_attributes(params[:deck])
        flash[:notice] = "Deck was updated."
        redirect_to @deck, notice: "Deck was saved successfully."
      else
        flash[:error] = "There was an error saving the deck. Please try again."
        render :edit
      end
  end

  def edit
    @deck = Deck.find(params[:id])
    @cards = Card.all.select do |card|
      not @deck.cards.include?(card)
    end
  end

  def destroy
    @deck = Deck.find(params[:id])
    title = @deck.title
     
    if @deck.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to decks_path
    else
      flash[:error] = "There was an error deleting the deck."
      render :show
    end
  end

end
