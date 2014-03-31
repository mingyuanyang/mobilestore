class Commentp < ActiveRecord::Base
  belongs_to :post
  attr_accessible :body
  validates :body, presence: true,
  length: { minimum: 10 }
end
