class UserController < ApplicationController

	def index
		if(current_user)
			@users = User.all
			@friends = Friend.all
			@currentuser=[]
			@myfiendnots=[]
			# @mynotifcates=[]
			@myfiendnotifcates=[]
			for use in @users do
      			if current_user.id == use.id
            		@currentuser << use
    			end
    		end	

			@orders = Order.all
			@friends = Friend.all
			@myorder=[]
			@myidfriends=[]
			@orderfriends=[]
			for order in @orders do
      			if current_user.id == order.user_id
            		@myorder << order
    			end
    		end	
    		@myorder=@myorder.last(3)

    		for friend in @friends do
      			if current_user.id == friend.user_id
            		@myidfriends<< friend.friend_id
    			end
    		end	
    		@myidfriends = @myidfriends.uniq

    		for forder in @orders do
      			for myfiend in @myidfriends do
	      			if forder.user_id == myfiend
	            		@orderfriends<< forder
	    			end
    			end	
    		end	
	@orderfriends=@orderfriends.last(3)

	# for show notifications
	@notifications = Notification.all

	for friendnot in @friends do
		if friendnot.user_id == current_user.id
    		@myfiendnots << friendnot
		end
	end	

	@myfiendnots=@myfiendnots.uniq
	for fnot in @myfiendnots do
		for myfdnotifcate in @notifications do
			if fnot.friend_id == myfdnotifcate.user_id
	    		@myfiendnotifcates << myfdnotifcate
			end
		end	
	end	

	@myfiendnotifcates=@myfiendnotifcates.last(10)

		else
			redirect_to "/users/sign_in"
		end	
	end

	def show
		@user = User.find(params[:id])

	end

	def sign_out
		# redirect_to users_path
		redirect_to "/users/sign_in"
	end

	def destroy
		@user = User.find(params[:id])
		if @user.destroy
			redirect_to users_path
		end
	end

	private

	def user_params
		params.require(:user).permit(:email)
	end

	end
