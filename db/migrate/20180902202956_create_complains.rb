class CreateComplains < ActiveRecord::Migration[5.2]
  def change
    create_table :complains do |t|
      t.text :body
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :complains, :body
  end
end
