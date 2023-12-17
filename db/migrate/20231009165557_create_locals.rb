class CreateLocals < ActiveRecord::Migration[7.0]
  def change
    create_table :locals do |t|
    
      t.string :title

      t.timestamps
     end
         
         Local.create :title => "Крим"
         Local.create :title => "Вінницька"
         Local.create :title => "Волинська"
         Local.create :title => "Донецька"
         Local.create :title => "Дніпропетровська"
         Local.create :title => "Житомирська"
         Local.create :title => "Закарпатська"
         Local.create :title => "Запорізька"
         Local.create :title => "Івано-Франківська"
         Local.create :title => "Київська"
         Local.create :title => "Кіровоградська"
         Local.create :title => "Луганська"
         Local.create :title => "Львівська"
         Local.create :title => "Миколаївська"
         Local.create :title => "Одеська"
         Local.create :title => "Полтавська"
         Local.create :title => "Рівненська"
         Local.create :title => "Сумська"
         Local.create :title => "Тернопільська"
         Local.create :title => "Харківська"
         Local.create :title => "Херсонська"
         Local.create :title => "Хмельницька"
         Local.create :title => "Черкаська"
         Local.create :title => "Чернівецька"
         Local.create :title => "Чернігівська"
         
         
  end
end
