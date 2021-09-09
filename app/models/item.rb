class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :send_days

  validates :item_name, :item_info, :image, presence: true
  validates :category_id, :item_status_id, :delivery_fee_id, :prefecture_id, :send_days_id, numericality: { other_than: 1 }
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 },
                      presence: { message: "can't be blank" }
  end
end
