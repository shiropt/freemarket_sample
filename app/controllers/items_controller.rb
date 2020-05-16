class ItemsController < ApplicationController
  
  def index
  end

  # 商品出品ページ
  def new
    if user_signed_in?
      @item = Item.new
      @item.images.build
    else
      # flash[:notice] = "商品の出品にはユーザー登録、もしくはログインをしてください"
      redirect_to signup_select_signup_index_path
    end
  end

  # 商品出品機能
    #テスト機能を実装
  def create
    @item = Item.new(item_params)
    if @item.save
      # flash[:notice] = "
      # 「#{@item.name}」を出品しました"
      # データの作成時点で、@itemにIDをが付与されている
      redirect_to @item
    else
      render :new
      # flash[:notice] = @item.errors.full_messages
    end
  end

  private

  def item_params
    params.require(:item).permit( :name, 
                                  :description,
                                  :price, 
                                  :size_id,
                                  :category_id, 
                                  :brand,
                                  :condition_id, 
                                  :shipping_fee_side, 
                                  :shipping_days_id, 
                                  :prefectures_id,  
                                  :user_id,
                                  images_attributes: {image: []}
                                 ).merge(user_id: current_user.id)
  end
end
