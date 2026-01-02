class UsersController < ApplicationController
  # GET /users/:id
  def show
    @user = User.find(params[:id])
    
    # => app/views/users/show.html.erb
  end

  def new
    @user = User.new
    # => app/views/users/new.html.erb
  end

  def create
    # paramas => users => user.save => if ... else ... end
    @user = User.new(user_params)
    if @user.save
      # 保存の成功をここで扱う。
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

    def user_params
      # Strong Parameters
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
