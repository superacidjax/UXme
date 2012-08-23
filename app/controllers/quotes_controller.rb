class QuotesController < ApplicationController

expose(:quote)

  def new
    render :layout => 'quotes'
  end

  def index
    redirect_to root_path
  end

  def create
    if quote.save
      redirect_to thanks_path
      # RequesterMailer.request_quote_email(quote).deliver
    else
      render action: "new"
    end
  end
end
