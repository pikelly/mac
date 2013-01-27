class GradesController < ApplicationController
  before_filter :find_by_id, :only => [:show, :edit, :update, :destroy]
  before_filter :find_all, :only => :index

  def new
    @grade = Grade.new
  end

  def create
    @grade = Grade.new(params[:grade])
    if @grade.save
      flash[:notice] = "Successfully created grade."
      redirect_to @grade
    else
      render :action => 'new'
    end
  end

  def update
    if @grade.update_attributes(params[:grade])
      flash[:notice] = "Successfully updated grade."
      redirect_to @grade
    else
      render :action => 'edit'
    end
  end

  def destroy
    @grade.destroy
    flash[:notice] = "Successfully destroyed grade."
    redirect_to grades_url
  end
end
