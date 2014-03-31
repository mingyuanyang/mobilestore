class Order < ActiveRecord::Base
  belongs_to :user
  has_many :orderitems, dependent: :destroy
  attr_accessible :order_date, :receiver_address, :receiver_mobile, :receiver_name, :user_id
  validates :receiver_name, :receiver_address, presence: true
  validates :receiver_mobile, format: { with: /08\d{8}/, message: "is not a valid mobile number" }
  validates :receiver_mobile, presence: true,
            length: { maximum: 10 }
end

class Collectorders < Order
  attr_accessor :handle
  def initialize (filename)
    @handle = File.open(filename, 'a')
  end
  def addorder (name, address, mobile, date)
    neworder = "#{name},#{address},#{mobile},#{date}"
    @handle.puts(neworder)
  end
  def addorderitems (itemtitle,price,quantity,totalprice)
    neworderitem = "#{itemtitle},#{price},#{quantity},#{totalprice}"
    @handle.puts (neworderitem)
  end
  def totalprice(totalprice)
    newtotal = "#{totalprice}"
    @handle.puts (newtotal)
  end
  def blankline
    @handle.write("\n")
  end
end
