class TweetsController < ApplicationController
  # GET /tweets
  # GET /tweets.json

  before_filter :get_zombie

  def get_zombie
    @zombie = @zombie.tweets.find(params[:id])
  end

  def index
    @tweets = @zombie.tweets

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tweets }
    end
  end

  def get_zombie
    @zombie = @zombie.tweets.find(params[:id])
  end
  # GET /tweets/1
  # GET /tweets/1.json
  def show
    @tweet = Tweet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tweet }
    end
  end

  # GET /tweets/new
  # GET /tweets/new.json
  def new
    @tweet = Tweet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tweet }
    end
  end

  # GET /tweets/1/edit
  def edit
    @tweet = Tweet.find(params[:id])
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = @zombie.tweets.new(params[:tweet])

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to [@zombie, @tweet], notice: 'Tweet was successfully created.' }
        format.json { render json: [@zombie, @tweet], status: :created, location: [@zombie, @tweet] }
      else
        format.html { render action: "new" }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tweets/1
  # PUT /tweets/1.json
  def update
    @tweet = Tweet.find(params[:id])

    respond_to do |format|
      if @tweet.update_attributes(params[:tweet])
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to tweets_url }
      format.json { head :no_content }
    end
  end
end
