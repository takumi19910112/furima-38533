class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nick_name,:password,:birth_day,:first_name,:last_name,:read_first,:read_last,presence: true
  validates :email,presence: true,uniqueness: true

  has_many :items
  has_many :orders
end
