class Sense < ApplicationRecord
   has_many :comments, as: :commentable, dependent: :destroy # Podkluchenie "Comments" Rukami 

   belongs_to :local
end
