class CreateLocals < ActiveRecord::Migration[7.0]
  def change
    create_table :locals do |t|
      t.string :alias
      t.string :title

      t.timestamps
    end
  end
end
