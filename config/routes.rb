Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :courses
      resources :learning_paths
      resources :talents, only: [] do
        post :assign_course, on: :member
        post :assign_path, on: :member
      end
    end
  end
end
