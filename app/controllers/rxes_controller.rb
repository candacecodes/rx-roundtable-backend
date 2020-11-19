class RxesController < ApplicationController
    def index
        rxes = Rx.all
        render json: rxes
    end

    def show
        if rx 
            render json: rx
        else 
            render json: { error: 'rx could not be found' }
        end
    end

end
