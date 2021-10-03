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
        print(slope)

        render json: {
            data: slope
        }
    end

    def get_slope(y_data, x_data)
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

        puts(y_error, x_error)

        return y_data_mean
    end

    def get_bias

    end

end