class CreateAuthorBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.references :author, foreign_key: true
      t.references :book, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
