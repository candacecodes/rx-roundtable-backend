class SelectedrxesController < ApplicationController
    def index
        selectedrxes = Selectedrx.all
        render json: selectedrxes
    end

    def show
        if selectedrx 
            render json: selectedrx
        else 
            render json: { error: 'selected rx could not be found' }
        end
    end

    def create
        selectedrx = Selectedrx.new(selectedrx_params)
        if selectedrx.save
            render json: selectedrx 
        else 
            render json: { error: 'selected rx could not be created' }
        end
    end

    def update
        selectedrx.update(selectedrx_params)
        if selectedrx.valid?
            render json: selectedrx
        else 
            render json: { error: 'selected rx could not be found' }
        end
    end

    def destroy
        if selectedrx
            selectedrx.delete
        else
            render json: { error: 'selected rx could not be found' }
        end
    end

    private
    def selectedrx_params
        params.require(:selectedrx)
    end

    def find_selectedrx
        selectedrx = Selectedrx.find(params[:id])
    end
end
