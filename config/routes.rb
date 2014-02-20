QuakismartBootstrap::Application.routes.draw do  
  
  root to: 'usgs#index'
  get 'usgs/index'
  get 'usgs/jquery'
  get 'usgs/jqueryui'
  get 'usgs/analytics'
  get 'usgs/about'
  get 'usgs/where'
  post 'usgs/search'
  get "errors/not_found"
  get "errors/server_error"
  
  
  if Rails.env.production?
    get "/404", to: "errors#not_found"
    get "/500", to: "errors#server_error" 
  end  
end
