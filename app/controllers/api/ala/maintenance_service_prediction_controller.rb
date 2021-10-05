class Api::Ala::MaintenanceServicePredictionController < ApplicationController
    
    def prediction
        array_for_prediction = params
        prediction = GenerateMaintenanceServicesPrediction.new(array_for_prediction).get_prediction

        if prediction
            response = {
                status: "success",
                message: "Successfully create predicitons",
                data: prediction
            }
            http_status = :ok
        else
            response = {
                status: "error",
                message: "Error in create prediction",
                data: prediction
            }     
            http_status = :unprocessable_entity
        end
        render json: response, status: http_status
    end
end