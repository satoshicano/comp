Rails.application.routes.draw do
  resources :food_recipes
  resources :food_steps
  resources :recipes
  resources :steps
  resources :dishes
  resources :foods
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
