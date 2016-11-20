class BranchesController < ApplicationController
    
    before_action :require_user, except: [:show]
    
    def new
        @branch = Branch.new
    end
    
    def create
        @branch = Branch.new(branch_params)
        if @branch.save
          flash[:success] = "Branch was created successfully"
          redirect_to companies_path
        else
          render 'new'
        end
    end
  
  def show
      @branch = Branch.find(params[:id])
      @companies = @branch.companies.paginate(page: params[:page],per_page: 4)
  end
  
  private
    def branch_params
       params.require(:branch).permit(:name) 
    end
end