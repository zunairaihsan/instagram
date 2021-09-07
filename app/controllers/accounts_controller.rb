class AccountsController < ApplicationController
    before_action :authenticate_account!
    
    def profile
        
        @account = Account.find(params[:id])
        @accountpost = Accountpost.find_by(params[:image])
    end
    def follow
        @account = Account.find(params[:id])
        current_account.followees << @account
        redirect_back(fallback_location: profile_path(@account))
    end
      
    def unfollow
        @account = Account.find(params[:id])
        current_account.followed_accounts.find_by(followee_id: @account.id).destroy
        redirect_back(fallback_location: profile_path(@account))
    end
    def search
        @results = Account.find(params[:id])
        if params[:search].blank?
            redirect_to accountposts_path and return
        else
            @parameter = params[:search].downcase
            @results = Account.all.where("lower(username) LIKE :search", search: "%#{@parameter}%")
        end
    end
end
   
