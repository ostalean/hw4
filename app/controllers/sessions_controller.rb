class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({"email" => params["email"]})


      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "Welcome #{@user["username"]}."
        redirect_to "/places"
      else 
        flash["notice"] = "Incorrect Password"
        redirect_to "/login"
  end

end
  def destroy
    # logout the user
    flash["notice"] = "Goodbye."
    session["user_id"] = nil
    redirect_to "/login"
  end
end
  