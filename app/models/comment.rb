class Comment < ApplicationRecord
    #belongs_to :article
    belongs_to :commentable, polymorphic: true
end
