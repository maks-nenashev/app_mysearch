class Local < ApplicationRecord
   has_many :articles
   has_many :senses
   has_many :things
end
