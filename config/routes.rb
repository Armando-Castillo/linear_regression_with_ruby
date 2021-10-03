Rails.application.routes.draw do
  namespace :api do
    namespace :ala do
      get "/prediction", to:"predictions#get_prediction" 
    end
  end

end
