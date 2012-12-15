class VotesController < ApplicationController
  # GET /votes
  # GET /votes.json]
  
  
      before_filter do
        @users = User.all
  end
  
  def votes 
    current_user.votes
  end
  
  def posts
    current_post.votes
  end
  
  def vote
    check = Vote.find(:first, :conditions => ["user_id = ? AND item_id = ?", session[:user_id], params[:id]])
post = Post.find(params[:id])
if check.nil?
vote = Vote.new
vote.post_id = params[:id]
vote.user_id = session[:user_id]
vote.value = true
vote.save
post.likes += 1
post.save
render :text => post.likes
elsif check.value == false
check.value = true
check.save
post.likes += 2
item.save
render :text => post.likes
else
render :text => "You have already voted up for this item."
end
end
  

  
  def index
    @votes = Vote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @votes }
    end
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
    @vote = Vote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vote }
    end
  end

  # GET /votes/new
  # GET /votes/new.json
  def new
    @vote = votes.new
    
    @users = current_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vote }
    end
  end

  # GET /votes/1/edit
  def edit
    @vote = Vote.find(params[:id])
  end

  # POST /votes
  # POST /votes.json
  def create
    
    
    @vote = Vote.new(params[:vote])

    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
        format.json { render json: @vote, status: :created, location: @vote }
      else
        format.html { render action: "new" }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /votes/1
  # PUT /votes/1.json
  def update
    @vote = Vote.find(params[:id])

    respond_to do |format|
      if @vote.update_attributes(params[:vote])
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy

    respond_to do |format|
      format.html { redirect_to votes_url }
      format.json { head :no_content }
    end
  end
end
