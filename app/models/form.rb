class Form < ApplicationRecord
  belongs_to :user
  has_many :questions, through: :form_questions
  has_many :form_questions

  validates :name, presence: true
  validates :name, length: { maximum: 50 }
  validates :presentation_key, uniqueness: true
end
