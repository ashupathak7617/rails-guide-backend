class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true

      t.string :likeable_type
      t.bigint :likeable_id

      t.timestamps
    end

    add_index :likes, [:likeable_type, :likeable_id]
  end
end
