class QuotesController < ApplicationController
  def index
    @quotes = Quote.all
  end

  def show
    @quote = Quote.find(params[:id])
  end

  def new
    @computer = Computer.first
    @quote = Quote.new :computer => @computer 
  end

  def create
    @quote = Quote.new(params[:quote])
    if @quote.save
      flash[:notice] = "Successfully created quote."
      redirect_to @quote
    else
      render :action => 'new'
    end
  end

  def edit
    @quote = Quote.find(params[:id])
  end

  def update
    @quote = Quote.find(params[:id])
    if @quote.update_attributes(params[:quote])
      flash[:notice] = "Successfully updated quote."
      redirect_to @quote
    else
      render :action => 'edit'
    end
  end

  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
    flash[:notice] = "Successfully destroyed quote."
    redirect_to quotes_url
  end
  
  def computer_changed
    @computer = Computer.find params[:id]
  end
  
  def calculate
    @quote = Quote.new params[:quote]
    if @value = @quote.calculate
      render :update do |page|
        page.replace_html "worth_value", @value
        page.call shuffle :contract => ["laptop_body"], :expand => ["worth_body"]
      end
      render "calculate_succeeded"
    else
      flash[:error] = @quote.errors.full_messages
      flash.discard
      render :update do |page|
        @computer = @quote.computer || Computer.first
        page.replace_html "laptop_body", render("laptop_body")
      end
    end
  end
end
