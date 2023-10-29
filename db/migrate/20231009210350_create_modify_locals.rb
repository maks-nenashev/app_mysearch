class CreateModifyLocals < ActiveRecord::Migration[7.0]
  
  def change
   add_index :locals, :alias, unique: true
      Local.create :alias => "cats", :title => "Котики"
      Local.create :alias =>"dogs", :title => "Собачки"
      Local.create :alias => "hamsters", :title => "Хомячки"
      Local.create :alias => "rabbits", :title => "Кролики"
      Local.create :alias => "turtles", :title => "Черепашки"
    
     
  end
  


end
