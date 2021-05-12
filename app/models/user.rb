class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :sex

  validates :nickname, presence: true
  validates :sex_id, :area_id, numericality: { other_than: 1 } 

  has_many :curriculums
end
