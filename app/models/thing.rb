class Thing < ApplicationRecord
   
  # mount_uploader :avatar, AvatarUploader # Zagruzka Fotak
   
   has_many :comments, as: :commentable, dependent: :destroy # Podkluchenie "Comments" Rukami delaem

   belongs_to :local
  end
