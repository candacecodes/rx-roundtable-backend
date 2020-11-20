class UsersController < ApplicationController

    def show
        if user 
            render json: user
        else 
            render json: { error: 'user could not be found' }
        end
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
          @token = encode_token(user_id: @user.id)
          render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
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

    def find_user
        user = User.find(params[:id])
    end

end
