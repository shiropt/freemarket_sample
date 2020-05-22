class ItemsController < ApplicationController
  
  def index
    @parents = Category.where(ancestry: nil)
    @ladies = Item.where(category_id: 1..250).includes(:images, :purchased_info).order("created_at DESC").limit(5)
    @mens = Item.where(category_id: 251..381).includes(:images, :purchased_info).order("created_at DESC").limit(5)
    @electrical_appliances = Item.where(category_id: 929..1000).includes(:images, :purchased_info).order("created_at DESC").limit(5)
    @toys = Item.where(category_id: 716..828).includes(:images, :purchased_info).order("created_at DESC").limit(5)
    @chanel = Item.where(brand: "シャネル").includes(:images, :purchased_info).order("created_at DESC").limit(5)
    @vuitton = Item.where(brand: "ヴィトン").includes(:images, :purchased_info).order("created_at DESC").limit(5)
    @supreme = Item.where(brand: "シュプリーム").includes(:images, :purchased_info).order("created_at DESC").limit(5)
    @nike = Item.where(brand: "ナイキ").includes(:images, :purchased_info).order("created_at DESC").limit(5)    
  end

  # 商品出品ページ
  def new
    if user_signed_in?
      @item = Item.new
      @item.images.build
    else
      flash[:notice] = "商品の出品にはユーザー登録、もしくはログインをしてください"
      redirect_to new_user_registration_path
    end
  end

  # 商品出品機能
  #テスト機能未実装
    def create
      @item = Item.new(item_params)
      unless @item.valid?
        flash.now[:alert] = @item.errors.full_messages
        @item.images.new
        render :new and return
      end
      if @item.save
        flash[:notice] = "「#{@item.name}」を出品しました"
        redirect_to root_path
      else
        render :new
      end
    end

    def show
      @item = Item.find(params[:id])
      @parents = Category.where(ancestry: nil)
  
    
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
                                  images_attributes: [:image]
                                 ).merge(user_id: current_user.id)
  end
  

end
