class Sense < ApplicationRecord
   has_many :comments, as: :commentable, dependent: :destroy # Podkluchenie "Comments" Rukami 
end
