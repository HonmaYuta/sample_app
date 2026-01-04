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
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user  # => GET /users/:id
      # redirect_to user_path(@user) # => GET /users/:id
      # redirect_to user_path(@user.id) # => GET /users/2
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
