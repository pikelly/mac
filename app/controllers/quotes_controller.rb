class QuotesController < ApplicationController
  skip_before_filter :login_required, :only => [:new, :calculate, :show, :computer_changed, :calculate, :validate_quote, :submit_quote ]
  def index
    @quotes = Quote.all
  end

  def show
    @quote = Quote.find(params[:id])
  end

  def new
    @computer = Computer.first
    @quote = Quote.new :computer => @computer, :comment => "Additional shipping information", :collection_date => 1.day.from_now
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
    if (@value = @quote.calculate)
      render :update do |page|
        if @value == "capped"
          page.replace_html "worth_body", :partial => "oversupply", :object => @quote.computer
        else
          page.replace_html "worth_value", @value
        end
      end
    else
      report_errors
    end
  end
  def validate_quote
    @quote = Quote.new params[:quote]
    if @quote.valid?
      head 200
    else
      report_errors
    end
  end
  def submit_quote
    params[:quote][:collection_date] = Time.parse params[:quote][:collection_date]
    @quote = Quote.new params[:quote]
    if @quote.valid?
      mail = Notifier.create_quote @quote
      status = Notifier.deliver(mail)
      pot = @quote.computer.pot
      pot.remainder -= @quote.calculate
      pot.save
      head 200
    else
      report_errors
    end    
  end
  private
  def report_errors
    err = @quote.errors.full_messages.map{|m| m.gsub(/Iagree is required/, "You must agree to the Terms and Conditions")}
    flash[:error] = err
    flash.discard
    render :update, :status => 400 do |page|
      @computer = @quote.computer || Computer.first
      page.alert(err.join("\n"))
    end
  end
end
