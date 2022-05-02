class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.integer :number, default: 1, null: false, max: 8
      t.date :event_at, null: false
      t.timestamps
    end
  end
end
