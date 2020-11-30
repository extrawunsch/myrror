class AddPredefinedToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :predefined, :boolean, default: false
  end
end
