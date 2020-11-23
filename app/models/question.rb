class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :forms
  has_many :users, through: :forms

  validates :category, presence: true
end
