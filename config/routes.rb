Rails.application.routes.draw do

  scope "(:locale)", locale: /en|ar|tr/ do
    mount Ckeditor::Engine => '/ckeditor'
  	root 'welcome#index'
    devise_for :users, :controllers => { :registrations => "users/registrations" }
    resources :enquiries
    resources :sliders
    resources :blogs, :only => [:show, :index]
    resources :admin do
      get "new_employee", :on => :collection
      post "create_employee", :on => :collection
    end
    
    resources :property_admin
    namespace :blog_admin do
      get '/' => 'home#index'
      resources :news do
        collection do
            get 'news_listing'
            get 'news_show', :controller => "news", :action => "news_show"
          end
        end
      resources :blogs do
        collection do
          get 'blog_listing'
          get 'blog_show', :controller => "blogs", :action => "blog_show"
        end
      end
    end

    resources :news
    scope '/admin' do
      get 'enquiries/index'
      get 'blogs/new' => 'blogs#new'
      
      resources :properties do
        collection do
          get 'flats'
          get 'house_villas'
          get 'lands'
          get 'luxury'
          get 'other_holdings'
        end
      end
    end
    scope '/property_admin', as: 'properties' do
      resources :properties do
        collection do
          get 'flats'
          get 'house_villas'
          get 'lands'
          get 'luxury'
          get 'other_holdings'
        end
      end
    end
    match 'users/:id' => 'users#destroy', :via => :delete

    resources :tag_names
    resources :comments, only: [:index, :create]
    get '/comments/new/(:parent_id)', to: 'comments#new', as: :new_comment
    get 'search_property' => 'search_property#index'
    get 'property_details' => 'search_property#show'
    get 'property_admins' => 'property_admin#index'
    get 'tags/:tag', to: 'blogs#index', as: :tag
  end
end