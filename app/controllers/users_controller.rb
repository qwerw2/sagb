class UsersController < ApplicationController
	def create
		@member = Member.new(member_params)
		if @member.save
			session[:member_id] = @member.id
		else
			flash[:errror_msg] = "signup fail"
			redirect_to root_path
		end
	end

	def new
		@member = Member.new
	end

	private
		def member_params
			params.require(:member).permit(:name, :email, :password) #set which field can permit modify 
		end
end