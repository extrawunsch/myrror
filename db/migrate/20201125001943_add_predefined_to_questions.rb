class AddPredefinedToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :predefined, :boolean, default: false
  end
end
