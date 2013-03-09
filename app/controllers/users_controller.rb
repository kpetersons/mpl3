class UsersController < Clearance::UsersController

  def show
    render :json => {:user => current_user}
  end

  def index
    render :json => {:users => current_user}
  end

end