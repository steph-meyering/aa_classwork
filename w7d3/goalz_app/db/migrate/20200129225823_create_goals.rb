class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.text :details
      t.string :visibility, null: false
      t.boolean :finished, null: false
      t.integer :cheers, null: false
      t.integer :author_id, null: false

      t.timestamps
    end
  end
end
