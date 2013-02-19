class CreateStudentAnswers < ActiveRecord::Migration
  def change
    create_table :student_answers do |t|
      t.integer :question_id
      t.integer :student_id
      t.string :value
      t.boolean :correct

      t.timestamps
    end
  end
end
