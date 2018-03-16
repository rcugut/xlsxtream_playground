Rails.application.routes.draw do

  root to: 'main#index'

  get '/download', to: 'main#download'

end
