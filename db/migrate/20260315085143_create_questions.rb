class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.integer :views_count, default: 0
      t.integer :likes_count, default: 0
      t.integer :answers_count, default: 0

      t.timestamps
    end
  end
end
