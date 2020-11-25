class UsersController < ApplicationController
skip_before_action :authorized, only: [:create]

    def profile
        render json: {user: UserSerializer.new(@user)}, status: :accepted
    end

    def show
        if user 
            render json: user
        else 
            render json: { error: 'user could not be found' }
        end
    end

    def create
        byebug 
        @user = User.create(user_params)
        if @user.valid?
          @token = encode_token(user_id: @user.id)
          render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
          render json: { error: @user.errors.full_messages }, status: :not_acceptable
        end
      end

# LOGGING IN
  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

    def update
        user.update(user_params)
        if user.valid?
            render json: user
        else 
            render json: { error: 'user could not be found' }
        end
    end

    def destroy
        if user
            user.delete
        else
            render json: { error: 'user could not be found' }
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
    # params.require(:project).permit(:name,  project_criteria: [:name, :type, :benefit] )


    def find_user
        user = User.find(params[:id])
    end

end
