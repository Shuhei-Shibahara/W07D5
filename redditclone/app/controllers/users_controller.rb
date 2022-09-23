class UsersController < ApplicationController
	before_action :require_logged_in, only: [:edit, :show, :update, :index, :destroy]

	def new 
		@user = User.new 
		render :new 
	end

	def create 
		@user = User.new(user_params)

		if @user&.save 
			login!(@user)
			redirect_to users_url
		else
			flash.now[:errors] = @user.errors.full_messages
			render :new
		end
	end

	def index 
		@users = User.all 
		render :index
	end

	def show 
		@user = User.find_by_id(params[:id])
		render :show
	end

	def edit
		@user = User.find_by_id(params[:id]) 
		render :edit
	end

	def update 
		@user = User.find_by_id(params[:id])

		if @user&.update(user_params) 
			redirect_to user_url(@user)
		else
			if @user 
				flash.now[:errors] = @user.errors.full_messages 
			else
				flash.now[:errors] = ["Could not update successfully"]
			end
			render :edit
		end
	end
end
