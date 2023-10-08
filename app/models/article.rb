class Article < ApplicationRecord

    
    mount_uploader :avatar, AvatarUploader # Zagruzka Fotak
    
    validates :title, presence: true, length: {minimum: 2} #walidacija
    validates :text, presence: true#, length: {minimum: 2}

    has_many :comments, as: :commentable # Podkluchenie "Comments" Rukami delaem
                                                 # has_many :comments, dependent: :nullify
    has_many :comments, dependent:  :delete_all   # :destroy ---=Dla udalenija Comentarija wmeste s Article


end
