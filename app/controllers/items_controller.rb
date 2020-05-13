class ItemsController < ApplicationController
  def index
    @items = Item.includes(:images, :purchased_info).limit(4).order("created_at DESC")
  end
end
