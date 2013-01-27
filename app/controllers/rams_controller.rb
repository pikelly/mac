class RamsController < ApplicationController
  before_filter :find_by_id, :only => [:show, :edit, :update, :destroy]
  before_filter :find_all, :only => [:index, :sort]

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

  def update
    if @ram.update_attributes(params[:ram])
      flash[:notice] = "Successfully updated ram."
      redirect_to @ram
    else
      render :action => 'edit'
    end
  end

  def destroy
    @ram.destroy
    flash[:notice] = "Successfully destroyed ram."
    redirect_to rams_url
  end
end
