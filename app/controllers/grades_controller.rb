class GradesController < ApplicationController
  def index
    @grades = Grade.all
  end

  def show
    @grade = Grade.find(params[:id])
  end

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

  def edit
    @grade = Grade.find(params[:id])
  end

  def update
    @grade = Grade.find(params[:id])
    if @grade.update_attributes(params[:grade])
      flash[:notice] = "Successfully updated grade."
      redirect_to @grade
    else
      render :action => 'edit'
    end
  end

  def destroy
    @grade = Grade.find(params[:id])
    @grade.destroy
    flash[:notice] = "Successfully destroyed grade."
    redirect_to grades_url
  end
end
