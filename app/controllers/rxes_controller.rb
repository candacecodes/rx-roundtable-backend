class RxesController < ApplicationController
    def index
        rxes = Rx.all
        render json: rxes
    end

    def create
        byebug
        @rx = Rx.create(rx_params)
        if @rx.valid?
          render json: @rx, status: :created
        else
          render json: { error: @rx.errors.full_messages }, status: :not_acceptable
        end
      end

    def show
        if rx 
            render json: rx
        else 
            render json: { error: 'rx could not be found' }
        end
    end

    private 
    def rx_params 
        params.require(:rx).permit(:name)
    end 
end
