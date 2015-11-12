Rails.application.routes.draw do
  
  match "graphs/new", to: "graphs#new", via: "post"
  
  resources :graphs


 # resources :uploads/new
  
 # get 'uploads/new'
  resources :uploads
  #get 'file_upload/index'

  devise_for :users , :skip => :registrations
  resources :survey_users
  resources :manageusers 
  resources :surveys do
    resources :questions do
    end
    resources :response_groups, only: [:new, :create, :show] do
      post 'next_question'
      get 'prev_question'
      get 'summary'
      get 'submit_summary'
    end
    post 'questions_order'
    get 'get_survey_object'
    get 'results'
  end
  post '/surveys/search_surveys'
  root :to => redirect('/surveys')
end
