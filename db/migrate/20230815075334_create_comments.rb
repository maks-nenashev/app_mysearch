class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :body
      #t.belongs_to :article, null: false, foreign_key: true
      t.references :commentable, polymorphic: true
      t.timestamps
    end
  end
end
