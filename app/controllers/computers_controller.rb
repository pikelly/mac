class ComputersController < ApplicationController
  before_filter :find_by_id, :only => [:show, :edit, :prices, :update, :destroy]

  def index
    @computers = Computer.all
  end

  def new
    @computer = Computer.new :laptop => true
  end

  def create
    @computer = Computer.new(params[:computer])
    if @computer.save
      flash[:notice] = "Successfully created computer."
      redirect_to @computer
    else
      render :action => 'new'
    end
  end

  def update
    if @computer.update_attributes(params[:computer])
      flash[:notice] = "Successfully updated computer."
      redirect_to @computer
    else
      render :action => 'edit'
    end
  end

  def destroy
    @computer.destroy
    flash[:notice] = "Successfully destroyed computer."
    redirect_to computers_url
  end
  
  def quote
    @computer = Computer.first
  end

  def sort
    @computers = Computer.all
    for computer in @computers
      computer.position = params["computer-list"].index(computer.id.to_s)+1
      computer.save
    end
    head 200
  end
  private
end
