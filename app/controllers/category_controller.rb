class CategoryController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
    @ladys = Category.find_by(name: "レディース")
    @mens = Category.find_by(name: "メンズ")
    @babys = Category.find_by(name: "ベビー・キッズ")
    @interias = Category.find_by(name: "インテリア・住まい・小物")
    @books = Category.find_by(name: "本・音楽・ゲーム")
    @hobys = Category.find_by(name: "おもちゃ・ホビー・グッズ")
    @beautys = Category.find_by(name: "コスメ・香水・美容")
    @cameras = Category.find_by(name: "家電・スマホ・カメラ")
    @sports = Category.find_by(name: "スポーツ・レジャー")
    @handmades = Category.find_by(name: "ハンドメイド")
    @tickets = Category.find_by(name: "チケット")
    @cars = Category.find_by(name: "自動車・オートバイ")
    @others = Category.find_by(name: "その他")

  end


  def show
    @categories = Category.find(params[:id])
    @parents = Category.where(ancestry:nil)
    
    
  end

end
