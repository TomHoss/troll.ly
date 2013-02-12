SnitchyServer::Application.routes.draw do
  root :to => "home#index"

  post 'api/v1/snitches/:id/slides' => "snitches#create"
  put 'api/v1/snitches/:id' => "snitches#update"
end
