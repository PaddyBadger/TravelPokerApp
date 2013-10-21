class CardsController < ApplicationController
  respond_to :html, :js

  def index
    @cards = Card.paginate(page: params[:page], per_page: 12)
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
      flash[:notice] = "card was saved."
    else
      flash[:error] = "There was an error saving the card. Please try again."
      render :new 
    end

    respond_with(@card)
  end

  def update
    @card = Card.find(params[:id])
    
      if @card.update_attributes(params[:card])
        flash[:notice] = "card was updated."
      else
        flash[:error] = "There was an error saving the card. Please try again."
        render :edit
      end

      respond_with(@card)
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
      flash[:notice] = "\"#{title}\" was deleted successfully."
    else
      flash[:error] = "There was an error deleting the card."
      render :show
    end

    respond_with(@card)
  end

end
