require 'mini_magick'
class CompaniesController < ApplicationController
   
   before_action :set_company, only: [:edit,:update,:like, :show, :user_likes]
   before_action :require_user, except: [:like]
   before_action :require_user_likes, only: [:like]
   before_action :require_admin, except: [:index, :show, :like,  :user_likes]
   before_action :require_same_user, only: [:edit, :update]
  
   
   def index
      @companies = Company.paginate(page: params[:page],per_page: 3)
   end
   
   def show
      
   end
   
   def new
      @company = Company.new
   end
   
   def create
      @company = Company.new(company_params)
      @company.user = current_user
      
      if @company.save
         flash[:success] = "Created Successfully!"
         redirect_to companies_path
      else
         render :new
      end
         
   end
   
   def edit
     
   end
   
   def update
      
      if @company.update(company_params)
         flash[:success] = "Updated Successfully!"
         redirect_to company_path(@company)
      else
         render :edit
      end
   end
   
   def like
      
      like = Like.create(like: params[:like], user: current_user, company: @company)
      if like.valid?
         flash[:success] = "You reviewed this company!"
      else 
         flash[:danger] = "You can only reviewed this company once!"
      end
      redirect_to likes_company_path(@company)
   end
   
   def user_likes
      
   end
   
   private
      def company_params
         params.require(:company).permit(:companyname,:date,:location,:package,:description,:picture,branch_ids: [])
      end
      
      def set_company
        @company = Company.find(params[:id])
     end
     
     def require_same_user
        if current_user != @company.user
           flash[:danger] = "You can only edit your own provided company info"
           redirect_to companies_path
        end
     end
     
     def require_user_likes
        if !logged_in?
           flash[:danger] = "You must be logged in to perform this action!"
           redirect_to :back
        end
     end
     
      def require_admin
        if !current_user.admin?
            flash[:danger] = "You must be an admin to perform this action!"
            redirect_to companies_path
        end
      end
end