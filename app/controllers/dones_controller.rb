class DonesController < ApplicationController
  respond_to :html, :js
  
  before_filter :load_doable

  def create
    @done = @doable.dones.new(params[:done])
    @done.user = current_user
    authorize! :create, Done, message: "Please Register to Mark as Done."

    if @done.save
      flash[:notice] = "Marked as Done!"
    else
      flash[:error] = "There was an error marking as Done. Please try again."
    end

    respond_with(@doable, location: @doable)
  end

  def destroy
    @done = Done.find(params[:id])
    @doable = @done.doable

    if @done.destroy
      flash[:notice] = "Undone!"
    else
      flash[:error] = "There was an error undoing. Please try again."
    end
    
    respond_with(@doable, location: @doable)
  end

  private

  def load_doable
    cls, id = request.path.split("/")[1..2]
    @doable = cls.singularize.classify.constantize.find(id)
  end 
end