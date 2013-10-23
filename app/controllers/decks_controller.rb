class DecksController < ApplicationController
  respond_to :html, :js
  
  def index
    @decks = Deck.paginate(page: params[:page], per_page: 12)
  end

  def show
     @deck = Deck.find(params[:id])
     @cards = @deck.cards.includes(:user).paginate(page: params[:page], per_page: 12)
  end

  def new
    @deck = Deck.new
    authorize! :create, Deck, message: "Please Register with TravelPoker to create your own decks."
    @cards = Card.all
  end

  def create
    @deck = current_user.decks.new(params[:deck])
    authorize! :create, Deck, message: "Please Register with TravelPoker to create your own cards."
    
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
    authorize! :edit, Deck, message: "You must own a deck to edit it."
    @cards = Card.all.select do |card|
      not @deck.cards.include?(card)
    end
  end

  def destroy
    @deck = Deck.find(params[:id])
    authorize! :destroy, Deck, message: "You must own a deck to delete it."
    title = @deck.title
     
    if @deck.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to decks_path
    else
      flash[:error] = "There was an error deleting the deck."
      render :show
    end
  end

 def copy
    @deck = Deck.find(params[:id])
    @deck_copy = @deck.dup
    @deck_copy.user = current_user
    @deck_copy.cards << @deck.cards
    
    if @deck.save
      flash[:notice] = "Deck was saved."
      redirect_to @deck
    else
      flash[:error] = "There was an error saving the deck. Please try again."
      render :new 
    end
  end
end
