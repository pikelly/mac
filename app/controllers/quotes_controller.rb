class QuotesController < ApplicationController
  before_filter :find_by_id, :only => [:show, :edit, :update, :destroy]
  skip_before_filter :login_required, :only => [:new, :calculate, :show, :computer_changed, :calculate, :validate_quote, :submit_quote,
                                                :terms_and_conditions, :about_us, :grading, :how_to_find]
  before_filter :find_all, :only => :index

  def new
    @computer = Computer.affordable.first
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

  def update
    if @quote.update_attributes(params[:quote])
      flash[:notice] = "Successfully updated quote."
      redirect_to @quote
    else
      render :action => 'edit'
    end
  end

  def destroy
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
  rescue => e
    @quote.errors.add_to_base e.message
    report_errors
  end
  def validate_quote
    @quote = Quote.new params[:quote]
    if @quote.valid?
      head 200
    else
      report_errors
    end
  rescue => e
    @quote.errors.add_to_base e.message
    report_errors
  end

  def contact
    mail = Notifier.create_contact params[:contact]
    Notifier.deliver(mail)
  end

  def submit_quote
    params[:quote][:collection_date] = Time.parse params[:quote][:collection_date]
    @quote = Quote.new params[:quote]
    if @quote.valid?
      mail = Notifier.create_quote @quote
      status = Notifier.deliver(mail)
      pot = @quote.computer.pot
      pot.remainder -= @quote.calculate.to_i
      pot.save
      head 200
    else
      report_errors
    end
  rescue => e
    @quote.errors.add_to_base e.message
    report_errors
  end
  private
  def report_errors
    err = @quote.errors.full_messages
    err.each do |m|
      m.gsub!(/Iagree is required.*/, "You must agree to the Terms and Conditions")
      m.gsub!(/^Packaged.*/, "You must package your computer")
    end
    flash[:error] = err
    flash.discard
    render :update, :status => 400 do |page|
      @computer = @quote.computer || Computer.first
      page.alert(err.join("\n"))
    end
  end
end
