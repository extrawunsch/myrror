class Form < ApplicationRecord
  belongs_to :user
  belongs_to :question, dependent: :destroy

  validates :name, presence: true
  validates :name, length: { maximum: 50 }
  validates :presentation_key, uniqueness: true
end
