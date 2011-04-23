class ComputersController < ApplicationController
  def index
    @computers = Computer.all
  end

  def show
    @computer = Computer.find(params[:id])
  end

  def new
    @computer = Computer.new
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

  def edit
    @computer = Computer.find(params[:id])
  end

  def update
    @computer = Computer.find(params[:id])
    if @computer.update_attributes(params[:computer])
      flash[:notice] = "Successfully updated computer."
      redirect_to @computer
    else
      render :action => 'edit'
    end
  end

  def destroy
    @computer = Computer.find(params[:id])
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

end
