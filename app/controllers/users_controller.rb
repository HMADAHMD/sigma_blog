class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def index
        @users = User.all
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "Account updated successfully"
            redirect_to articles_path(@article)
        else
            render 'edit'
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome to sigma Blog #{@user.username}"
            redirect_to articles_path(@article)
        else
            render 'new'
        end

    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end