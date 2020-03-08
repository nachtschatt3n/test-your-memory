class Image < ApplicationRecord
  has_many :questions
  accepts_nested_attributes_for :questions, :allow_destroy => true
  has_attached_file :src, :styles => { :medium => "750x700>", :thumb => "75x70>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_file_name :src, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]

  #do_not_validate_attachment_file_type :src



  def to_s
    label
  end
  

  def next
    Image.where("id > ?", id).first
  end

  def prev
    Image.where("id < ?", id).last
  end

end
