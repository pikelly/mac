class PricesController < ApplicationController
  before_filter :find_by_id, :only => [:show, :edit, :update, :destroy]
  before_filter :find_all, :only => :index

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

  def update
    if @price.update_attributes(params[:price])
      flash[:notice] = "Successfully updated price."
      redirect_to @price
    else
      render :action => 'edit'
    end
  end

  def destroy
    @price.destroy
    flash[:notice] = "Successfully destroyed price."
    redirect_to prices_url
  end
end
