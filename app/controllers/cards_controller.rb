class CardsController < ApplicationController
  require "payjp"
  before_action :set_card
  before_action :set_parents, only: [:index, :new]

  def index
    # すでにクレジットカードが登録しているか？
    if @card.present?
      # pay.jpからカード情報を取得する
      # pay.jpの秘密鍵をセットする。
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      # pay.jpから顧客情報を取得する。
      customer = Payjp::Customer.retrieve(@card.customer_id)
      # pay.jpの顧客情報から、デフォルトで使うクレジットカードを取得する。
      @card_info = customer.cards.retrieve(customer.default_card)
      # クレジットカード情報から表示させたい情報を定義する。
      #カード会社の画像習得
      @card_brand = @card_info.brand
      # クレジットカードの有効期限を取得
      @exp_month = @card_info.exp_month.to_s
      @exp_year = @card_info.exp_year.to_s.slice(2,3) 
      # 習得した@card_brandごとにロゴを定義
      case @card_brand
      when "Visa"
        @card_image = "visa.jpg"
      when "JCB"
        @card_image = "jcb.jpg"
      when "MasterCard"
        @card_image = "master.jpg"
      when "American Express"
        @card_image = "american.jpg"
      when "Diners Club"
        @card_image = "diners.jpg"
      when "Discover"
        @card_image = "discover.jpg"
      end
    end
  end


  def new
    # cardがすでに登録済みの場合、indexのページに戻す
    @card = CreditCard.where(user_id: current_user.id).first
    redirect_to action: "index" if @card.present?
  end

  def create
    # pay.jpと通信するので秘密鍵をセット
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    # JSでトークンは正しく作られているか？
    if params['payjpToken'].blank?
      render "new"
    else
      # pay.jpに登録されるユーザーを作成
      customer = Payjp::Customer.create(
        description: 'test',
        email: current_user.email,
        card: params['payjpToken'],
        metadata: {user_id: current_user.id}
      )
      # テーブルに保存
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id)
      if @card.save
        redirect_to action: "index", notice:"支払い情報の登録が完了しました"
      else
        render 'new'
      end
    end
  end

    # card情報とpay.jp側の情報を削除
  def destroy     
    # 秘密鍵をセットして、PAY.JPから情報をする。
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    # pay.jpの顧客情報を取得
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete # pay.jpの顧客情報を削除
    if @card.destroy # furima上でもクレジットカードを削除
      redirect_to action: "index", notice: "削除しました"
    else
      redirect_to action: "index", alert: "削除できませんでした"
    end
  end

  private
  def set_card
    @card = CreditCard.where(user_id: current_user.id).first if CreditCard.where(user_id: current_user.id).present?
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end
end
