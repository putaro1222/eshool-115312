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
end
