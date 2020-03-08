class Question < ApplicationRecord
  has_many :answers
  accepts_nested_attributes_for :answers, :allow_destroy => true

  belongs_to :image
  accepts_nested_attributes_for :image, :allow_destroy => true
end
