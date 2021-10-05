Rails.application.routes.draw do
  namespace :api do
    namespace :ala do
      get "maintenance_service_prediction", to:"maintenance_service_prediction#prediction" 
    end
  end

end
