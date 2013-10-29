class CardsController < ApplicationController
  respond_to :html, :js

  def index
    @cards = Card.paginate(page: params[:page], per_page: 12)
  end

  def search
    
    @cards = Card.search do
      keywords params[:query]
    end.results

    respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @cards }
    end
  end

  def show
    @card = Card.where(id: params[:id]).first

    if @card
       @comments = @card.comments.includes(:user)
       @json = @card.to_gmaps4rails
    else
      redirect_to :root
    end

  end

  def new
    @card = Card.new
    authorize! :create, Card, message: "Please Register with TravelPoker to create your own cards."
  end

  def create
    @card = Card.new(params[:card])
    @card.user = current_user
    authorize! :create, Card, message: "Please Register with TravelPoker to create your own cards."
    
    if @card.save
      respond_with(@card)
    else
      alert[:error] = "There was an error saving the card. Please try again."
      render :new
    end
  end

  def update
    @card = Card.find(params[:id])
    
      if @card.update_attributes(params[:card])
        respond_with(@card)
      else
        alert[:error] = "There was an error saving the card. Please try again."
        render :edit
      end
  end

  def edit
    @card = Card.find(params[:id])
    authorize! :edit, Card, message: "You must own a card to edit it."
    respond_with(@card)
  end

  def destroy
    @card = Card.find(params[:id])
    authorize! :destroy, Card, message: "You must own a card to delete it."
    title = @card.title
     
    if @card.destroy
      alert[:notice] = "\"#{title}\" was deleted successfully."
      respond_with(@card)
    else
      alert[:error] = "There was an error deleting the card."
      render :show
    end
  end
end

    #autocomplete = client.autocomplete(:input => :query)
    #autocomplete.predictions.first.description
