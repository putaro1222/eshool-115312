class Sex < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '男性' },
    { id: 3, name: '女性' },
    { id: 4, name: 'レズビアン' },
    { id: 5, name: 'ゲイ' },
    { id: 6, name: '両性愛' },
    { id: 7, name: 'トランスジェンダー' },
    { id: 8, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :users

end