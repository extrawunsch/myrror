class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :users, through: :forms
  has_many :form_questions, dependent: :destroy
  has_many :forms, through: :form_questions

  validates :question_type, :question_content, presence: true
  validates :question_content, length: { maximum: 200 }
end
