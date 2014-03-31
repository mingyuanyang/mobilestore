class OrdersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_staff, :except => [:new, :create, :show]
  before_filter :ensure_customer, :only => [:new, :create]
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all(:order => "created_at desc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    if current_user and current_user.admin == 'customer'
    @order = current_user.orders.find(params[:id])
    else
      @order = Order.find(params[:id])
      end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  #  def edit
  #    @order = Order.find(params[:id])
  #  end

  # POST /orders
  # POST /orders.json
  def create
    @order = current_user.orders.new(params[:order])

    @p1 = Collectorders.new("allorders.txt")
    total=0
    @p1.addorder(params[:order][:receiver_name],params[:order][:receiver_address],params[:order][:receiver_mobile],DateTime.now)

    @cart = session[:cart] || {}
    @cart.each do |id, quantity|
      item = Item.find_by_id(id)
      @orderitem = @order.orderitems.build(:item_id => item.id, :title => item.title, :description => item.description, :quantity => quantity, :price => Filteranddiscount.rundiscount(item.discount,item.price))
      @orderitem.save
      total += quantity * Filteranddiscount.rundiscount(item.discount,item.price)
      @p1.addorderitems(item.title,Filteranddiscount.rundiscount(item.discount,item.price),quantity,quantity*Filteranddiscount.rundiscount(item.discount,item.price))
    end
      @p1.totalprice(total)
      @p1.blankline
    respond_to do |format|
      if @order.save
        @cart.clear
        format.html { redirect_to thank_you_url, notice: 'Your order will be delivered in 5 working days.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  #  def update
  #    @order = Order.find(params[:id])

  #    respond_to do |format|
  #      if @order.update_attributes(params[:order])
  #        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
  #        format.json { head :no_content }
  #      else
  #        format.html { render action: "edit" }
  #        format.json { render json: @order.errors, status: :unprocessable_entity }
  #      end
  #    end
  #  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
