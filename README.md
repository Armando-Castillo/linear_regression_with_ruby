# Time series linear regression 

No extra gems for prediction or time series linear regression needed, we just need dependent array

The algorithms is located on path: app/services/generate_maintenance_services_prediction.rb
The controller is: app/controllers/api/ala/maintenance_service_prediction_controller.rb

Params recieved: array of dependent variables
Response of algorithm: {
        "prediction_array": [],
        "prediction_next_month": number
}

Response of controller API: {
    "status": "",
    "message": "",
    "data": {
        "prediction_array": [],
        "prediction_next_month": number
    }
}

* Ruby version: 2.5.8