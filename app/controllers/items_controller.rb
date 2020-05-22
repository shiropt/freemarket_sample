class ItemsController < ApplicationController
  
  def index
    @parents = Category.where(ancestry: nil)
    @items = Item.where(purchased_info_id: nil).includes(:images, :purchased_info).order("created_at DESC").limit(3)
  end

  # 商品出品ページ
  def new
    if user_signed_in?
      @item = Item.new
      @item.images.build
      def get_category_children
        @category_children = Category.find_by(id: "#{params[:parent_id]}", ancestry: nil).children
      end
    
      def get_category_grandchildren
        @category_grandchildren = Category.find("#{params[:child_id]}").children
      end
     
    else
      flash[:alert] = "商品の出品にはユーザー登録、もしくはログインをしてください"
      redirect_to new_user_registration_path
    end
  end

  # 商品出品機能
  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "「#{@item.name}」を出品しました"
      redirect_to root_path
    else
      # 画像を残せないのでこの仕様は保留
      # flash.now[:alert] = @item.errors.full_messages
      # if @item.images.empty?
      #   @item.images.build
      # end
      # render :new and return
      redirect_to new_item_path, alert: "出品できません。入力必須項目を確認してください"
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
