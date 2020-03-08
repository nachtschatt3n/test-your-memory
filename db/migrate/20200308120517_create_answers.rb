class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.boolean :correct
      t.string :label

      t.timestamps
    end
  end
end
