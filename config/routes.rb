Rails.application.routes.draw do
  root to: 'employees#index'
  concern :sdes do
    resources :sdes
  end
  resources :employees, concerns: :sdes do 
    get :get_hierarchy, on: :collection
    get :top_employees, on: :collection
  end
end
