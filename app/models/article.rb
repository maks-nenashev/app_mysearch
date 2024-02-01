class Article < ApplicationRecord

    has_one_attached :image # Foto!
    
    validates :title, presence: true, length: {minimum: 2} #walidacija
    validates :text, presence: true#, length: {minimum: 2}

    has_many :comments, as: :commentable, dependent: :destroy# Podkluchenie "Comments" delaem
       
    
    belongs_to :local
    
    def self.ransackable_attributes(auth_object = nil)
      ["image", "created_at", "id", "local_id", "text", "title", "updated_at"]
      end
    def self.ransackable_associations(auth_object = nil)
      ["comments", "local"]
      end
    
  end
