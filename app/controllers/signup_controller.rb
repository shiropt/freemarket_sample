class SignupController < ApplicationController
  before_action :step1_valid, only: :step2            # step2前にstep1をバリデーションにかける為
  
  def step1
    @user = User.new                  # 空のインスタンス定義
    @user.build_profile               # nicknameをprofilesテーブルに保存する為の関連付け
  end

  # before_actionでバリデーションをかける
  def step1_valid
    session[:user_params] = user_params
    session[:profile_attributes_after_step1] = user_params[:profile_attributes]
    @user = User.new(session[:user_params])
    @user.build_profile(session[:profile_attributes_after_step1])
    render '/signup/step1' unless @user.valid?
  end

  def step2
    @user = User.new
    @user.build_address
  end

  # step2で画面更新を行った際再びstep2を初期状態で表示させる為
  def show
    @user = User.new
    @user.build_address
    render "step2"
  end

  # step2のバリデーションはcreateアクション内で実行される仕様
  def create
    @user = User.new(session[:user_params])
    @user.build_profile(session[:profile_attributes_after_step1])
    @user.build_address(user_params[:address_attributes])
    if @user.save                                  # 登録データをDBへ保存
      session[:id] = @user.id                      # user.idをsessionに入れるとログイン状態となる
      redirect_to done_signup_index_path
    else
      render 'step2'
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
