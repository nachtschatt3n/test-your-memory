class Image < ApplicationRecord
  has_many :questions

  has_attached_file :src, styles: { normal: "750x700>", thumb: "75x70>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end
