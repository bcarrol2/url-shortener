Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get 'converts/index'
      post 'converts/create'
    end
  end
  get 'stordy/:id', to: 'api/v1/converts#show'
end
