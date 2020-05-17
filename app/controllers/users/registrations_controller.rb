# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :set_parents, only: [:new, :create, :edit, :update]

  # GET /resource/sign_up
  def new
    @user = User.new
    @user.build_profile
    @user.build_address
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
    redirect_to root_path
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

 
  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end
  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :gender,
      :birth_day,
      profile_attributes: [:nickname],
      address_attributes: [:post_code,
                           :prefecture_id,
                           :city, :block,
                           :building,
                           :telephone_number]])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :gender,
      :birth_day,
      profile_attributes: [:nickname],
      address_attributes: [:post_code,
                           :prefecture_id,
                           :city, :block,
                           :building,
                           :telephone_number]])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end



end
