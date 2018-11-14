class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 USER_PARAMS = %i(name email password password_confirmation).freeze

  validates :name, presence: true
end
