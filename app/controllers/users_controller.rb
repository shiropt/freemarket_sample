class UsersController < ApplicationController
  def show
    @parents = Category.where(ancestry: nil)
    redirect_to new_user_registration_path unless user_signed_in?
  end
end
