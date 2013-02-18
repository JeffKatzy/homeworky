R20130216Homeworky::Application.routes.draw do

  resources :teachers, :classrooms, :students, :sms
  root to: 'teachers#index'
  match '/signup',  to: 'teachers#new'

  post "calls/create"

  match ':controller(/:action(/:id(.:format)))'
  match ':controller(/:action(.:format))'
end
