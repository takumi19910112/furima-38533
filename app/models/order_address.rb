class OrderAddress
  include ActiveModel::Model

  attr_accessor :post_code,:prefecture_id,:municipalities,:address,:building_name,:phone_number,:user_id,:item_id,:token

with_options presence: true do
  validates :token,:user_id, :item_id,:municipalities,:address
  validates :prefecture_id,numericality: { other_than: 1 , message: "can't be blank"}
  validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: '数字は半角で3桁ハイフン4桁で入力してください' }
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :phone_number, format: { with: VALID_PHONE_REGEX }
end


  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, phone_number: phone_number, building_name: building_name, order_id: order.id)
  end


end