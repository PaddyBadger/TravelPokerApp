class DecksController < ApplicationController
  respond_to :html, :js
  
  def index
    @decks = Deck.paginate(page: params[:page], per_page: 24)
  end

  def show
     @deck = Deck.find(params[:id])
     @cards = @deck.cards.includes(:user).paginate(page: params[:page], per_page: 12)
     @json = @deck.cards.to_gmaps4rails
  end

  def search
    
    @decks = Deck.search do
      keywords params[:query]
    end.results

    respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @decks }
    end
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
      redirect_to edit_deck_path(@deck)
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
    @cards = Card.paginate(page: params[:page], per_page: 12) do |card|
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
    @deck_copy.remote_image_url = @deck.image.url
    @deck_copy.cards << @deck.cards
    
    if @deck_copy.save
      flash[:notice] = "Deck was saved."
      redirect_to @deck_copy
    else
      flash[:error] = "There was an error saving the deck. Please try again."
      render :new 
    end
  end

  def feed
    # this will be the name of the feed displayed on the feed reader
    @title = "Travel Poker Feed"

    # the news items
    @decks = Deck.order("updated_at desc")

    # this will be our Feed's update timestamp
    @updated = @decks.first.updated_at unless @decks.empty?

    respond_to do |format|
      format.atom { render :layout => false }

      # we want the RSS feed to redirect permanently to the ATOM feed
      format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
    end
  end
end
