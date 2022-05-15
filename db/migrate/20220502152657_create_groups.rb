class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :faculty
      t.string :specialty
      t.string :cource
      t.string :group
      t.string :sub_group
      t.timestamps
    end
  end
end
