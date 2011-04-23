class ProcessorsController < ApplicationController
  def index
    @processors = Processor.all
  end

  def show
    @processor = Processor.find(params[:id])
  end

  def new
    @processor = Processor.new
  end

  def create
    @processor = Processor.new(params[:processor])
    if @processor.save
      flash[:notice] = "Successfully created processor."
      redirect_to @processor
    else
      render :action => 'new'
    end
  end

  def edit
    @processor = Processor.find(params[:id])
  end

  def update
    @processor = Processor.find(params[:id])
    if @processor.update_attributes(params[:processor])
      flash[:notice] = "Successfully updated processor."
      redirect_to @processor
    else
      render :action => 'edit'
    end
  end

  def destroy
    @processor = Processor.find(params[:id])
    @processor.destroy
    flash[:notice] = "Successfully destroyed processor."
    redirect_to processors_url
  end

  def sort
    @processors= Processor.all
    for processor in @processors
      processor.position = params["processor-list"].index(processor.id.to_s)+1
      processor.save
    end
    head 200
  end

end
