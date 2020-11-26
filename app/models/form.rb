class Form < ApplicationRecord
  belongs_to :user
  has_many :form_questions, dependent: :destroy
  has_many :questions, through: :form_questions

  validates :name, presence: true
  validates :speaker, presence: true
  validates :name, length: { maximum: 120 }
  validates :presentation_key, uniqueness: true
end
