class CreateThings < ActiveRecord::Migration[7.0]
  def change
    create_table :things do |t|
        
        t.string :title
        t.text :text
        t.integer :local_id
        
        t.timestamps
    end
  end
end
