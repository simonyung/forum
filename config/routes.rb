Rails.application.routes.draw do
 resource :posts
 root 'post#index'
end
