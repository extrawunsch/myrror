class Form < ApplicationRecord
  belongs_to :user
  has_many :form_questions, dependent: :destroy
  has_many :questions, through: :form_questions

  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
  validates :speaker, presence: true
  validates :name, length: { maximum: 120 }
  validates :presentation_key, uniqueness: true
end

Form.first.questions.map { |question| question.answers }
