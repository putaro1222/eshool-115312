class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :sex

  validates :nickname, presence: true
  validates :sex_id, :area_id, numericality: { other_than: 1 } 

  has_many :curriculums
  has_many :studies
  has_many :sns_credentials

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
   if user.persisted?
    sns.user = user
    sns.save
   end
   { user: user, sns: sns }
  end
end
