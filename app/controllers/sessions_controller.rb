class SessionsController < ApplicationController

    def new

    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "Logged in successfully"
            redirect_to user_path(user)
        else
            flash.now[:danger] = "Something went wrong"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "You have logged out"
        redirect_to root_path
    end

    private

    def session_params
        params.require(:session).permit(:email, :password)
      end

end