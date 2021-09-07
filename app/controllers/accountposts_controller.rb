# frozen_string_literal: true

class AccountpostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]  

  def index
    @accountposts = Accountpost.all.order(created_at: :desc)
  end

  def show 
  end

  def new
    @accountpost = Accountpost.new
  end

  def edit 
  end

  def create
    @account = current_account
    @accountpost = @account.accountposts.new(accountposts_params)
    @accountpost.account_id = current_account.id if account_signed_in?
    params[:accountpost][:images] do |image|
      @accountpost.image.attach(image)
    end
    if @accountpost.save
      redirect_to accountposts_path
      flash[:notice] = 'Saved ...'
    else
      flash[:alert] = 'Something went wrong ...'
      render:new
    end
  end

  def upvote
    @accountposts = Accountpost.find(params[:id])
      @accountposts.upvote_by current_account
      redirect_back fallback_location: accountposts_path
  end

  def downvote
    @accountposts = Accountpost.find(params[:id])
      @accountposts.downvote_by current_account
      redirect_back fallback_location: accountposts_path
  end
  
  def update
    @account = current_account
    @accountposts = Accountpost.find(params[:id])
    respond_to do |format|
      if @accountpost.update(accountposts_params)
        format.html { redirect_to accountposts_path, notice: 'Accountpost was successfully updated.' }
        
      else
        format.html { render :edit, status: :unprocessable_entity }   
      end
    end
  end
  
  def destroy
    @accountposts= Accountpost.find(params[:id])
    @accountposts.images.each do |image|
      image.purge
    end
    @accountposts.destroy
    respond_to do |format|
      format.html { redirect_to accountposts_url, notice: 'Accountpost was successfully destroyed.' }
    end
  end

  private
    def set_post
      @accountpost = Accountpost.find(params[:id])
    end

    def accountposts_params
      params.require(:accountpost).permit(:content, images:[])
    end
end
