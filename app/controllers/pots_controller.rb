class PotsController < ApplicationController
  before_filter :find_by_id, :only => [:show, :edit, :update, :destroy]
  def index
    @pots = Pot.all
  end
  
  def new
    @pot = Pot.new
  end
  
  def create
    @pot = Pot.new(params[:pot])
    if @pot.save
      flash[:notice] = "Successfully created pot."
      redirect_to pots_url
    else
      render :action => 'new'
    end
  end
  
  def update
    if @pot.update_attributes(params[:pot])
      flash[:notice] = "Successfully updated pot."
      redirect_to @pot
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @pot.destroy
    flash[:notice] = "Successfully destroyed pot."
    redirect_to pots_url
  end
end
