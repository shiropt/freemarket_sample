class BuyersController < ApplicationController
  require "payjp"
  before_action :set_card, :set_item

  def index
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to new_card_path
    end
  end

  def buy
    # すでに購入されていないか？
    if @item.purchased_info_id.present? 
      redirect_back(fallback_location: root_path) 
    else
      # 購入者もいないし、クレジットカードもあるし、決済処理に移行
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      # 請求を発行
      Payjp::Charge.create(
      amount: @item.price,
      customer: @card.customer_id,
      currency: 'jpy'
      )
      # 購入したので、purchased_infoの情報をアップデートして売り切れにします。
      @purchased_info = PurchasedInfo.new
      @today = Date.today
      if @purchased_info.update(user_id: current_user.id, item_id: @item.id, purchase_date: @today, shipping_fee: @item.shipping_fee_side)
        @item.update(purchased_info_id: @purchased_info.id)
        flash[:buynotice] = '商品を購入しました。'
        redirect_to root_path
      else
        flash[:buyalert] = '商品の購入に失敗しました。'
        redirect_to controller: 'items', action: 'index'
      end
    end
  end

  private
  def set_card
    @card = CreditCard.where(user_id: current_user.id).first if CreditCard.where(user_id: current_user.id).present?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
