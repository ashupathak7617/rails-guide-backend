class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.references :user, null: false, foreign_key: true

      t.string :commentable_type
      t.bigint :commentable_id

      t.timestamps
    end

    add_index :comments, [:commentable_type, :commentable_id]
  end
end
