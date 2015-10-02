class SessionsController < ApplicationController
  skip_before_filter :authenticate_user

  def new # login page
  end

  def create #create the login session
    #username and password
    user = User.find_by_username(params[:username])
    if user.present? && user.authenticate(params[:password])
      set_user_session(user)
      redirect_to root_path, notice: "Successfully loged in!"
    else
      flash[:alert] = 'Username or Password did not match.'
      render :new
    end
  end

  def destroy
    @session.destroy
    respond_to do |format|
      format.html { redirect_to sessions_url, notice: 'Session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
end
