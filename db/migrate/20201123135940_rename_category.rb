class RenameCategory < ActiveRecord::Migration[6.0]
  def change
    rename_column :questions, :category, :question_topic
  end
end
