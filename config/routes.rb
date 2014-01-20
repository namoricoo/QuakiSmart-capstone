QuakismartBootstrap::Application.routes.draw do  
  get "errors/not_found"
  get "errors/server_error"
  root to: 'usgs#index'
  get 'usgs/jquery'
  get 'usgs/jqueryui'
  post 'usgs/search'
  if Rails.env.production?
    get "/404", :to => "errors#not_found"
    get "/500", :to => "errors#server_error" 
  end  
end
