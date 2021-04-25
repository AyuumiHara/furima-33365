class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  VALID_PASSWORD_REGEX = (/[a-z\d]{8,}/i)
    validates :password, format: { with: VALID_PASSWORD_REGEX }

  #バリデーション修正-20210424
  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :birth_day
  end

end
