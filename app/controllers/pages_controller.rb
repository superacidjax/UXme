class PagesController < ApplicationController

  def home
  end

  def about
    render :layout => 'quotes'
  end

  def contact
    render :layout => 'quotes'
  end

  def our_process
    render :layout => 'quotes'
  end

  def thanks
    render :layout => 'quotes'
  end
end
