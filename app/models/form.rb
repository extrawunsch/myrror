class Form < ApplicationRecord
  belongs_to :user
  has_many :questions, through: :form_questions
  has_many :form_questions, dependent: :destroy

  validates :name, presence: true
  validates :speaker, presence: true
  validates :name, length: { maximum: 120 }
  validates :presentation_key, uniqueness: true
end
