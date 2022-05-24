class CreateLessonWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :lesson_works do |t|
      t.integer :lesson_id, null: false
      t.integer :student_id, null: false
      t.integer :present, default: 0, null:false
      t.integer :score, default: 0, null:false
      t.string :comment

      t.timestamps
    end
  end
end
