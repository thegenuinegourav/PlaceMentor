class PagesController < ApplicationController
    def home
        redirect_to companies_path if logged_in?
    end
    
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:success]="You have been logged in"
            redirect_to companies_path
        else
            flash.now[:danger]="Incorrect email or password"
            render 'home'
        end
    end
    
    def destroy
        session[:user_id]=nil
        flash[:success]="You have been logged out"
        redirect_to root_path
    end
end