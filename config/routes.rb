GoodMorningDave::Application.routes.draw do
  resources :preferences

  get "welcome/index"
  root "welcome#index"
end
