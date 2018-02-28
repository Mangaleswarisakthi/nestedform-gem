Rails.application.routes.draw do
  get 'project/index'
  get 'project/show'
get 'project/alltask'
get 'project/update'
post 'project/update'

get 'project/new'
get 'project/destroy'
get 'project/edit'
post 'project/edit'
get 'project/create'
get 'project/update'
get 'project/uptasks'
post 'project/uptasks'
post 'project/create'

  resources :project
root 'project#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
