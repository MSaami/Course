Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :courses
      resources :learning_paths do
        resources :learning_path_enrollments, only: [:create]
      end
      resources :talents, only: [] do
        post :assign_course, on: :member
        post :complete_course, on: :member
      end
    end
  end
end

