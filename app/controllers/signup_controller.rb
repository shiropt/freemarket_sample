class SignupController < ApplicationController
  before_action :signup_page_1_valid, only: :signup_page_2            # page_2前にpage_1をバリデーションにかける為

  def signup_select
  end
  
  def signup_page_1
    @user = User.new                  # 空のインスタンス定義
    @user.build_profile               # nicknameをprofilesテーブルに保存する為の関連付け
  end

  # before_actionでバリデーションをかける
  def signup_page_1_valid
    session[:user_params] = user_params
    session[:profile_attributes_after_page1] = user_params[:profile_attributes]
    @user = User.new(session[:user_params])
    @user.build_profile(session[:profile_attributes_after_page1])
    render '/signup/new_registration_page_1' unless @user.valid?
  end

  def signup_page_2
    @user = User.new
    @user.build_address
  end

  # page_2で画面更新を行った際再びstep2を初期状態で表示させる為
  def show
    @user = User.new
    @user.build_address
    render "signup_page_2"
  end

  # page_2のバリデーションはcreateアクション内で実行される仕様
  def create
    @user = User.new(session[:user_params])
    @user.build_profile(session[:profile_attributes_after_page1])
    @user.build_address(user_params[:address_attributes])
    if @user.save                                  # 登録データをDBへ保存
      session[:id] = @user.id                      # user.idをsessionに入れるとログイン状態となる
      redirect_to done_signup_index_path
    else
      render 'signup_page_2'
      return
    end
  end

  # 登録完了画面へ
  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  private
  # ストロングパラメータで許可するキーを設定
    def user_params
      params.require(:user).permit(
        :email,
        :password,
        :password_confirmation,
        :last_name,
        :first_name,
        :last_name_kana,
        :first_name_kana,
        :gender,
        :birth_day,
        address_attributes: [:id, :post_code, :prefecture_id, :city, :block, :building, :telephone_number],
        profile_attributes: [:id, :nickname]
      )
    end
end
