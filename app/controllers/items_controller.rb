class ItemsController < ApplicationController
  def index
  end

  def show
    @items = Item.find(params[id])
    @users = User.find(params[id])
    
  end
end
