class WishController < ApplicationController
   def index
    @wishes = wish.find(:all)
  end

  def show
    @wish = wish.find(params[:id])
  end

  def new
    @wish = wish.new
  end

  def create
    @wish = wish.new(params[:wish])
    if @wish.save!
        redirect_to :action => "index"
    else
      render :action => "new"
    end
    
  end
end
