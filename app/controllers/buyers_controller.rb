class BuyersController < ApplicationController
 
  def show
    @parents = Category.where(ancestry: nil)
    @item = Item.find(params[:id])
    
  end

  def done
  end
end
