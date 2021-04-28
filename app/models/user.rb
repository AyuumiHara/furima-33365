class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  VALID_PASSWORD_REGEX = (/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i)
    validates :password, format: { with: VALID_PASSWORD_REGEX }

  #validates :email, uniqueness: true

  #バリデーション修正-20210428
  with_options presence: true do
    validates :nickname
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :birth_day

    with_options format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/} do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/} do
      validates :last_name_kana
      validates :first_name_kana
    end
  end

end
