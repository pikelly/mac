class PricesController < ApplicationController
  def index
    @prices = Price.all
  end

  def show
    @price = Price.find(params[:id])
  end

  def new
    @price = Price.new
  end

  def create
    @price = Price.new(params[:price])
    if @price.save
      flash[:notice] = "Successfully created price."
      redirect_to @price
    else
      render :action => 'new'
    end
  end

  def edit
    @price = Price.find(params[:id])
  end

  def update
    @price = Price.find(params[:id])
    if @price.update_attributes(params[:price])
      flash[:notice] = "Successfully updated price."
      redirect_to @price
    else
      render :action => 'edit'
    end
  end

  def destroy
    @price = Price.find(params[:id])
    @price.destroy
    flash[:notice] = "Successfully destroyed price."
    redirect_to prices_url
  end
end
