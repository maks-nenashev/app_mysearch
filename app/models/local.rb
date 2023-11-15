class Local < ApplicationRecord
   has_many :articles
   has_many :senses
   has_many :things
   
   def self.ransackable_attributes(auth_object = nil) 
      ["articles", "senses", "things"]
     end
   def self.ransackable_attributes(auth_object = nil)
      ["created_at", "id", "title", "updated_at"]
     end
   def self.ransackable_associations(auth_object = nil)
         ["articles", "senses", "things"]
     end
   end
