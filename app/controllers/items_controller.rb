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
    #テスト機能未実装
    def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        render :new
      end
    end

    # def create
    #   @item = Item.new(item_params)
    #   unless @item.valid?
    #     flash.now[:alert] = @item.errors.full_messages
    #     @item.images.new
    #     render :new and return
    #   end
    #   if @item.save
    #     redirect_to root_path
    #   else
    #     @item.images.new
    #     render :new
    #   end
    # end

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
                                  images_attributes: [:id, :image]
                                 ).merge(user_id: current_user.id)
  end
end
