class UsersController < ApplicationController
skip_before_action :authorized, only: [:create]

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
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
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
      end

# LOGGING IN
  def login
    byebug
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
        params.permit(:username, :password, :user)
    end
    # params.require(:project).permit(:name,  project_criteria: [:name, :type, :benefit] )


    def find_user
        user = User.find(params[:id])
    end

end
