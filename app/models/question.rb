class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :forms
  has_many :users, through: :forms

  validates :question_type, :question_content, presence: true
  validates :question_content, uniqueness: true
  validates :question_content, length: { maximum: 200 }
end
