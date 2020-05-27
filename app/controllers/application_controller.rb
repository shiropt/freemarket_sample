class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :gender, :birth_day,
      profile_attributes: [:nickname],
      address_attributes: [:address_last_name,
                           :address_first_name,
                           :address_last_name_kana,
                           :address_first_name_kana,
                           :post_code,
                           :prefecture_id,
                           :city,
                           :block,
                           :building,
                           :telephone_number]])
    devise_parameter_sanitizer.permit(:account_update, keys: [
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :gender,
      :birth_day,
      profile_attributes: [:nickname],
      address_attributes: [:address_last_name,
                           :address_first_name,
                           :address_last_name_kana,
                           :address_first_name_kana,
                           :post_code,
                           :prefecture_id,
                           :city,
                           :block,
                           :building,
                           :telephone_number]])
  end
  private
  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

end

