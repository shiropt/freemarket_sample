class ItemsController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
    @items = Item.where(purchased_info_id: nil).includes(:images, :purchased_info).order("created_at DESC").limit(3)
  end


end
