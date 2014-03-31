class Post < ActiveRecord::Base
  attr_accessible :text, :title
  has_many :commentps, dependent: :destroy
  belongs_to :user
  validates :title, presence: true,
            length: { minimum: 5 }
  validates :text, presence: true,
            length: { minimum: 10 }
end
