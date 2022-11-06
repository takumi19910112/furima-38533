class Item < ApplicationRecord
  validates :product_name, :product_description, :images,presence: true

    validates :price,numericality: { only_integer: true, greater_than_or_equal_to: 300,less_than_or_equal_to: 9_999_999},
      presence: { messasge: "can't be blank"}
      validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }
 
  validates :category_id, :condition_id, :contribution_id, :prefecture_id, :delivery_id, numericality: { other_than: 1 , message: "can't be blank"}

  has_many_attached :images
  belongs_to :user
  has_one :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :contribution
  belongs_to :delivery
  belongs_to :prefecture
  has_many :comments
end
