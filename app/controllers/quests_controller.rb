class QuestsController < ApplicationController
  before_filter :require_user
  
  def create
    @user = current_user
    @quest = @user.quests.create(params[:quest])
 
    respond_to do |format|
   
    format.html {   redirect_to quest_path(@quest)}# show.html.erb
    format.js
    end
 
  end
  def index
    
  end
  
  def show
    @quest = Quest.find(params[:id])
    if params[:add_user] 
      @user = User.find_by_name(params[:add_user])
      @quest.users << @user
    end
     respond_to do |format|
   
      format.html {render "_quest" }# show.html.erb
      format.json { render :json => @quest }
      format.js
    end
  end
  def add_user
  
  end
end
