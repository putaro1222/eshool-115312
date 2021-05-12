class Curriculum < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :class_url
    validates :class_name
    validates :class_info
    validates :image
   end

  validates :category_id, numericality: { other_than: 1 } 
  
  has_one_attached :image
  belongs_to :user
  has_one :study
end
