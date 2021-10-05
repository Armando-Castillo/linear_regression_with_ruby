class Api::Ala::MaintenanceServicePredictionController < ApplicationController
    
    def prediction
        prediction = GenerateMaintenanceServicesPrediction.new().get_prediction
        puts(prediction)
        #if prediction.success?
        #    response = {
        #        status: "success",
        #        message: "Successfully create predicitons",
        #        data: prediction.result 
        #    }
        #    http_status = :ok
        #else
        #    response = {
        #        status: "error",
        #        message: "Error in create prediction",
        #         data: prediction.errors
        #    }     
        #    http_status = :unprocessable_entity
        #render json: response, status: http_status
    end
end