Courseapp::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  get 'ui(/:action)', controller: 'ui'
  get 'courses/:id/chapters/:chapter_id/video/:video_id', controller: 'chapters', action: 'show', as: 'show_video'
 
  get 'quizzes/:id/question/:question_id', controller: 'quizzes', action: 'show', as: 'show_question'
  get 'quizzes/:id/quiz_success', controller: 'quizzes', action: 'complete', as: 'quiz_complete' 
  post 'answer/:id', controller: 'answers', action: 'check_answer', as: 'check_answer'
  resources :courses, only: [:show] do
    resources :chapters, only: [:show]
  end

  resources :chapters, only: [:show] do
    resources :quizzes, only: [:show]
  end

  resources :quizzes, only: [:show] do
  end

  resources :questions, only: [:show] do
  end

  end
