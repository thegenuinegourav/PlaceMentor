require 'mini_magick'
class CompaniesController < ApplicationController
   
   def index
      @companies = Company.all 
   end
   
   def show
      @company = Company.find(params[:id])
   end
   
   def new
      @company = Company.new
   end
   
   def create
      @company = Company.new(company_params)
      @company.user = User.find(1)
      
      if @company.save
         flash[:success] = "Created Successfully!"
         redirect_to companies_path
      else
         render :new
      end
         
   end
   
   def edit
      @company = Company.find(params[:id])
   end
   
   def update
      @company = Company.find(params[:id])
      if @company.update(company_params)
         flash[:success] = "Updated Successfully!"
         redirect_to company_path(@company)
      else
         render :edit
      end
   end
   
   private
      def company_params
         params.require(:company).permit(:companyname,:date,:location,:package,:description,:picture)
      end
end