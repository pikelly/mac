class DisksController < ApplicationController
  before_filter :find_by_id, :only => [:show, :edit, :update, :destroy]

  def index
    @disks = Disk.all
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

  def update
    if @disk.update_attributes(params[:disk])
      flash[:notice] = "Successfully updated disk."
      redirect_to @disk
    else
      render :action => 'edit'
    end
  end

  def destroy
    @disk.destroy
    flash[:notice] = "Successfully destroyed disk."
    redirect_to disks_url
  end

  def sort
    @disks = Disk.all
    for disk in @disks
      disk.position = params["disk-list"].index(disk.id.to_s)+1
      disk.save
    end
    head 200
  end

end
