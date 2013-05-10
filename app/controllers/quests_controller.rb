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
    @inv = @quest.involvements.where("user_id=?",current_user)
    @inv[0].destroy
   respond_to do |format|
         format.html {render "_quest" }# show.html.erb
      format.json { render :json => @quest }
      format.js   
    
  end
  end
  
  def show
    @quest = Quest.find(params[:id])
    if params[:add_user] 
      @user = User.find_by_name(params[:add_user])
      @quest.users << @user
    end
      if params[:add_user_by_mail] 
        UserMailer.invite_mail(@quest,current_user,params[:add_user_by_mail]).deliver
    end
     respond_to do |format|
   
      format.html {render "_quest" }# show.html.erb
      format.json { render :json => @quest }
      format.js
    end
  end
  def add_user
  
  end
   def n
    @inv = @quest.involvements.where("user_id=?",current_user)
    @inv[0].destroy
   respond_to do |format|
         format.html {render "_quest" }# show.html.erb
      format.json { render :json => @quest }
      format.js   
    
  end

  end

end
