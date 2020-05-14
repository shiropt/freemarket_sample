class CategoryController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
  end


  def show
    @parents = Category.where(ancestry: nil)
    @ladys = Category.where(ancestry: 1)
  end

end
