Rails.application.routes.draw do

  get 'looks/index'
  root to: "looks#index"
end
