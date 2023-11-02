class CreateLocals < ActiveRecord::Migration[7.0]
  def change
    create_table :locals do |t|
    
      t.string :title

      t.timestamps
     end
    
         Local.create :title => "Киевская"
         Local.create :title => "Сумская"
         Local.create :title => "Харьковская"
         Local.create :title => "Кировоградская"
         Local.create :title => "Черниговская"
  
  end
end
