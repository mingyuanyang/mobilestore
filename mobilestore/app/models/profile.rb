class Profile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :address, :firstname, :lastname, :mobile,:user_id
  validates :user_id, uniqueness: true
  validates :firstname, :lastname, :address, presence: true
  validates :mobile, format: { with: /08\d{8}/, message: "is not a valid mobile number" }
  validates :mobile, presence: true,
            length: { maximum: 10 }
end
