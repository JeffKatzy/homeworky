class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question
      t.text :answer
      t.integer :lesson_id

      t.timestamps
    end
  end
end
