class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user, :category, :brand, :purchased_info).limit(3).order("created_at DESC")
  end
end
