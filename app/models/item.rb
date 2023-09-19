class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :delivery_region
  belongs_to :delivery_date

  belongs_to :user
  has_one_attached :image

  validates :image, :name, :content, presence: true

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  validates :category_id, :condition_id, :delivery_fee_id, :delivery_region_id, :delivery_date_id,
            numericality: { other_than: 1, message: "can't be blank" }
end
