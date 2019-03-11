class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  #validates leaving a comment where all must be true/content in commment section, stars rated, user id prod id
  validates :body, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true }

  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_asc, -> { order(rating: :asc) }

end
