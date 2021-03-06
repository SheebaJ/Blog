Rails.application.routes.draw do

  devise_for :users
  
  get 'categories',to: 'categories#index', as: 'categories'
  get 'categories/new',to: 'categories#new', as: 'new_category'
  get 'categories/:id',to: 'categories#show', as: 'category'
  post 'categories',to: 'categories#create' 
  get 'categories/:id/edit',to: 'categories#edit', as: 'edit_category'
  patch 'categories/:id',to: 'categories#update'
  delete 'categories/:id',to: 'categories#destroy'

  get 'articles',to: 'articles#index', as: 'articles'
  get 'articles/new',to: 'articles#new', as: 'new_article'
  post 'articles',to: 'articles#create'
  get 'articles/:id',to: 'articles#show', as:'article'
  get 'articles/:id/edit',to: 'articles#edit', as: 'edit_article'
  patch 'articles/:id',to: 'articles#update'
  delete 'articles/:id',to: 'articles#destroy'
 
  get 'comments',to: 'comments#index', as: 'comments'
  get 'comments/new',to: 'comments#new', as: 'new_comment'
  post 'comments',to: 'comments#create'
  get 'comments/:id',to: 'comments#show', as:'comment'
  get 'comments/:id/edit',to: 'comments#edit', as: 'edit_comment'
  patch 'comments/:id',to: 'comments#update'
  delete 'comments/:id',to: 'comments#destroy'

  root 'articles#index'
end
