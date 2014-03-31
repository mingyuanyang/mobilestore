class Commentf < ActiveRecord::Base
  belongs_to :forum
  belongs_to :user
  attr_accessible :body, :user_id
  validates :body, presence: true,
            length: { minimum: 10 }
end
