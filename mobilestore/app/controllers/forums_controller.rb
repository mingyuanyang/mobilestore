class ForumsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  # GET /forums
  # GET /forums.json
  def index
    @forums = Forum.all.sort {|a, b|
      a_time = if a.commentfs.last then a.commentfs.last.created_at else a.created_at end
      b_time = if b.commentfs.last then b.commentfs.last.created_at else b.created_at end

      b_time <=> a_time
    }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @forums }
    end
  end

  # GET /forums/1
  # GET /forums/1.json
  def show
    @forum = Forum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @forum }
    end
  end

  # GET /forums/new
  # GET /forums/new.json
  def new
    @forum = Forum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @forum }
    end
  end

  # GET /forums/1/edit
  def edit
    if current_user and current_user.admin == 'manager'
      @forum = Forum.find(params[:id])
    else
      if (current_user and current_user.admin == 'customer') or (current_user and current_user.admin == 'worker')
        @forum = current_user.forums.find(params[:id])
      end
    end
  end

  # POST /forums
  # POST /forums.json
  def create
    @forum = current_user.forums.new(params[:forum])

    respond_to do |format|
      if @forum.save
        format.html { redirect_to @forum, notice: 'Forum was successfully created.' }
        format.json { render json: @forum, status: :created, location: @forum }
      else
        format.html { render action: "new" }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /forums/1
  # PUT /forums/1.json
  def update
    if current_user and current_user.admin == 'manager'
      @forum = Forum.find(params[:id])
    else
      if (current_user and current_user.admin == 'customer') or (current_user and current_user.admin == 'worker')
        @forum = current_user.forums.find(params[:id])
      end
    end
    respond_to do |format|
      if @forum.update_attributes(params[:forum])
        format.html { redirect_to @forum, notice: 'Forum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forums/1
  # DELETE /forums/1.json
  def destroy
    if current_user and current_user.admin == 'manager'
      @forum = Forum.find(params[:id])
      @forum.destroy
    else
      if (current_user and current_user.admin == 'customer') or (current_user and current_user.admin == 'worker')
        @forum = current_user.forums.find(params[:id])
        @forum.destroy
      end
    end

    respond_to do |format|
      format.html {
        if current_user and current_user.admin == 'manager'
          redirect_to forums_url
        else
          redirect_to profiles_url
        end
      }
      format.json { head :no_content }
    end
  end
end
