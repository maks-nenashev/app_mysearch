class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|

      t.string :title
      t.text :text
      #t.integer :created_by
     # t.integer :local_id
      
      t.timestamps
    end
  end
end
