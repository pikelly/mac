class RamsController < ApplicationController
  def index
    @rams = Ram.all
  end

  def show
    @ram = Ram.find(params[:id])
  end

  def new
    @ram = Ram.new
  end

  def create
    @ram = Ram.new(params[:ram])
    if @ram.save
      flash[:notice] = "Successfully created ram."
      redirect_to @ram
    else
      render :action => 'new'
    end
  end

  def edit
    @ram = Ram.find(params[:id])
  end

  def update
    @ram = Ram.find(params[:id])
    if @ram.update_attributes(params[:ram])
      flash[:notice] = "Successfully updated ram."
      redirect_to @ram
    else
      render :action => 'edit'
    end
  end

  def destroy
    @ram = Ram.find(params[:id])
    @ram.destroy
    flash[:notice] = "Successfully destroyed ram."
    redirect_to rams_url
  end
end
