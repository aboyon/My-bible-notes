class UsersController < PrivateController

  def dashboard
    @note = Note.new
  end

end
