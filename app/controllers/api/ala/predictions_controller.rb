class Api::Ala::PredictionsController < ApplicationController

    def get_prediction
        #y_data = params.permit(:values => [])
        #x_data = Array.new(y_data.length)
        y_data = [2127580.38, 1546738.88, 1860183.83, 1471997.62,
        1996467.07, 2742112.46, 3321632.14, 3392582.59, 4055801.37,
        5731173.04, 6084247.69, 6591827.96]

        x_data = Array.new(y_data.length) { |i| i = i+1 }
        
        #Get slope (m/b1/a)
        slope = get_slope(y_data, x_data)
        bias = get_bias(y_data, x_data, slope)

        prediction_dataset = []
        prediction_dataset = get_prediction_dataset(slope, bias, x_data)

        prediction_next_month = 0
        prediction_next_month = prediction_dataset.last

        render json: {
            data: {
                prediction_array: prediction_dataset,
                prediction_next_month: prediction_next_month
            }
        }
    end

    def get_slope(y_data, x_data)
        slope = 0

        y_data_mean = 0
        y_data_mean = y_data.inject{ |sum, i| sum + i }.to_f / y_data.size

        x_data_mean = 0
        x_data_mean = x_data.inject{ |sum, i| sum + i }.to_f / x_data.size

        y_error = []
        for value in y_data do
            y_error.push << value - y_data_mean
        end

        x_error = []
        for value in x_data do
            x_error.push << value - x_data_mean
        end

        data_single_errors = []
        y_error.zip(x_error).each do |y_value, x_value|
            data_single_errors << y_value*x_value
        end
        
        data_error_sum = 0
        for value in data_single_errors do
            data_error_sum = data_error_sum + value
        end

        x_standardized_errors = []
        for value in x_error do
            x_standardized_errors.push << value**2
        end

        x_stand_errors_sum = 0
        for value in x_standardized_errors do
            x_stand_errors_sum = x_stand_errors_sum + value
        end

        slope = data_error_sum/x_stand_errors_sum

        return slope
    end

    def get_bias(y_data, x_data, slope)
        bias = 0

        y_data_mean = 0
        y_data_mean = y_data.inject{ |sum, i| sum + i }.to_f / y_data.size

        x_data_mean = 0
        x_data_mean = x_data.inject{ |sum, i| sum + i }.to_f / x_data.size

        bias = y_data_mean - (slope*x_data_mean)

        return bias
    end

    def get_prediction_dataset(slope, bias, x_data)
        slope_values = []
        x_data << (x_data.last + 1)
        for value in x_data do
            slope_values << (slope*value) + bias
        end

        return(slope_values)
    end
end