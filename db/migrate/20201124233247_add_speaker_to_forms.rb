class AddSpeakerToForms < ActiveRecord::Migration[6.0]
  def change
    add_column :forms, :speaker, :string
  end
end
