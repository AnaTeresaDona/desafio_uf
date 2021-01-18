Rails.application.routes.draw do
  get 'uf/:date', to: 'ufs#question' #ruta uf más una variable (por eso los :)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'client/:name', to: 'ufs#count_question'
end
