class QuotesController < ApplicationController
  def index
    @quotes = Quote.all
  end

  def show
    @quote = Quote.find(params[:id])
  end

  def new
    @computer = Computer.first
    @quote = Quote.new :computer => @computer, :comment => "Additional shipping information"
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
      end
      return
    else
      flash[:error] = @quote.errors.full_messages
      flash.discard
      render :update, :status => 400 do |page|
        @computer = @quote.computer || Computer.first
        page.alert(@quote.errors.full_messages.join("\n"))
        #page.replace_html "laptop_body", render("laptop_body")
      end
    end
  end
  def validate_shipping
    @quote = Quote.new params[:quote]
    head 200
  end
end
