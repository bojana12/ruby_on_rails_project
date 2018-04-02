class Comment < ApplicationRecord
  belongs_to :article

  validates :article, :author_name, :body, presence: true
end
