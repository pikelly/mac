class PotsController < ApplicationController
  def index
    @pots = Pot.all
  end
  
  def show
    @pot = Pot.find(params[:id])
  end
  
  def new
    @pot = Pot.new
  end
  
  def create
    @pot = Pot.new(params[:pot])
    if @pot.save
      flash[:notice] = "Successfully created pot."
      redirect_to @pot
    else
      render :action => 'new'
    end
  end
  
  def edit
    @pot = Pot.find(params[:id])
  end
  
  def update
    @pot = Pot.find(params[:id])
    if @pot.update_attributes(params[:pot])
      flash[:notice] = "Successfully updated pot."
      redirect_to @pot
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @pot = Pot.find(params[:id])
    @pot.destroy
    flash[:notice] = "Successfully destroyed pot."
    redirect_to pots_url
  end
end
