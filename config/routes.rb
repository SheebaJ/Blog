Rails.application.routes.draw do
  get 'articles',to: 'articles#index', as: 'articles'
  post 'articles',to: 'articles#create' 
  get 'articles/new',to: 'articles#new', as: 'new_article'
  get 'articles/:id/edit',to: 'articles#edit', as: 'edit_article'
  get 'articles/:id',to: 'articles#show' ,as: 'article'
  patch 'articles/:id',to: 'articles#update' 
  delete 'articles/:id',to: 'articles#destroy'
 
  get 'categories',to: 'categories#index', as: 'categories'
  post 'categories',to: 'categories#create' 
  get 'categories/new',to: 'categories#new', as: 'new_category'
  get 'categories/:id/edit',to: 'categories#edit', as: 'edit_category'
  get 'categories/:id',to: 'categories#show' ,as: 'category'
  patch 'categories/:id',to: 'categories#update'
  delete 'categories/:id',to: 'categories#destroy'

  root 'articles#index'
end
