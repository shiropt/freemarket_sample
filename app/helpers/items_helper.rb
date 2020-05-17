module ItemsHelper
  # 送料負担を定義
  def shipping_fee_side
    fee = @item.shipping_fee_side
  if fee ===true
      "送料込み"
    else
      "着払い（購入者負担）"
    end
  end
end
      
