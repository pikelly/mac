class DisksController < ApplicationController
  def index
    @disks = Disk.all
  end

  def show
    @disk = Disk.find(params[:id])
  end

  def new
    @disk = Disk.new
  end

  def create
    @disk = Disk.new(params[:disk])
    if @disk.save
      flash[:notice] = "Successfully created disk."
      redirect_to @disk
    else
      render :action => 'new'
    end
  end

  def edit
    @disk = Disk.find(params[:id])
  end

  def update
    @disk = Disk.find(params[:id])
    if @disk.update_attributes(params[:disk])
      flash[:notice] = "Successfully updated disk."
      redirect_to @disk
    else
      render :action => 'edit'
    end
  end

  def destroy
    @disk = Disk.find(params[:id])
    @disk.destroy
    flash[:notice] = "Successfully destroyed disk."
    redirect_to disks_url
  end
end
