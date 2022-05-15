class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.references :group, null: false, foreign_key: true
      t.timestamps
    end
  end
end
