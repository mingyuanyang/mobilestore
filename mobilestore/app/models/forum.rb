class Forum < ActiveRecord::Base
  attr_accessible :text, :title
  has_many :commentfs, dependent: :destroy
  belongs_to :user
  validates :title, presence: true,
            length: { minimum: 5 }
  validates :text, presence: true,
            length: { minimum: 10 }
end
