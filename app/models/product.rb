class Product < ApplicationRecord
  has_one_attached :featured_image
  has_rich_text :description
  has_and_belongs_to_many :categories

  validates :name, presence: :true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
