class Question < ApplicationRecord
  has_many :answers
  accepts_nested_attributes_for :answers, :allow_destroy => true

  belongs_to :image
  accepts_nested_attributes_for :image, :allow_destroy => true

  def next
    Question.where("id > ?", id).first
  end

  def prev
    Question.where("id < ?", id).last
  end

end
