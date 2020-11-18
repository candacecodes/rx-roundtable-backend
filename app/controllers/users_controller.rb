class UsersController < ApplicationController

    def show
        if user 
            render json: user
        else 
            render json: { error: 'user could not be found' }
        end
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user 
        else 
            render json: { error: 'user could not be created' }
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
    
end
