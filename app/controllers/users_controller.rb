class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user]) #Failed validation will render 'new' auto-populated.
		if @user.save
			session[user_id]
			redirect_to @user, notice: "Thank you for signing up to Ribbit!"
		else
			render 'new'		
		end
		
	end

	def show
		@user = User.find(params[:id])
		@ribbit = Ribbit.new
		
	end
end
