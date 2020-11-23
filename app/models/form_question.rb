class FormQuestion < ApplicationRecord
  belongs_to :question
  belongs_to :form
end
