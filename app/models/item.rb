class Item < ApplicationRecord
  validates :product_name, :product_description, :image, presence: true

    validates :price,numericality: { only_integer: true, greater_than_or_equal_to: 300,less_than_or_equal_to: 9_999_999},
      presence: { messasge: "can't be blank"}

 
  validates :category_id, :condition_id, :contribution_id, :prefecture_id, :delivery_id, numericality: { other_than: 1 , message: "can't be blank"}

  has_one_attached :image
  belongs_to :user
  has_one :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :contribution
  belongs_to :delivery
  belongs_to :prefecture
end
