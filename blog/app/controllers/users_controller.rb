class UsersController < ApplicationController
  def create
    @candidate = User.new(user_params)
    if @candidate.save
      flash[:notice] = "New Candidate Added Successfully"
      redirect_to(users_path)
    else
      render('new')
    end
  end

  private

    def user_params
      #Whitelisting for strng parameters
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :qualification, :college, :stream, :phone)
    end


end
