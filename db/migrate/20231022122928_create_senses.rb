class CreateSenses < ActiveRecord::Migration[7.0]
  def change
    create_table :senses do |t|
      t.string :title
      t.text :text
      t.integer :local_id
      
      t.timestamps
    end
  end
end
