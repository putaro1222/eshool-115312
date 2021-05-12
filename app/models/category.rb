class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'プログラミング' },
    { id: 3, name: 'デザイン' },
    { id: 4, name: '金融' },
    { id: 5, name: 'メンタル' },
    { id: 6, name: '起業' },
    { id: 7, name: '性教育' },
    { id: 8, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :curriculums

end