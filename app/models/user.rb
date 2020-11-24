class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :forms, dependent: :destroy
  has_many :questions, through: :forms

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
