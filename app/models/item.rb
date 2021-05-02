class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :area
  belongs_to :shipping_day

  #空の投稿ができないようにする
  validates :image, :item_name, :item_text, presence: true

  #価格について、空の投稿ができないようにする、かつ、半角数字のみ、かつ、金額範囲
  with_options presence: true do
    validates :price, format: { with: /\A[0-9]+\z/}, inclusion: { in: 300..9_999_999 }
  end

  #「--]を選択している場合は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :area_id
    validates :shipping_day_id
  end
end
