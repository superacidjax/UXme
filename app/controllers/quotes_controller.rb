class QuotesController < ApplicationController

expose(:quote)

  def request_quote
  end

  def new
  end

  def index
    redirect_to root_path
  end

  def create
    if quote.save
      flash[:success] = 'Your request has been received. Thanks!'
      redirect_to thanks_path
      # RequesterMailer.request_quote_email(quote).deliver
    else
      render action: "new"
    end
  end
end
