Biblioteca::Application.routes.draw do
  # rotas para usuarios
  get    'usuarios',          to: 'usuarios#index',   as: :usuarios
  post   'usuarios',          to: 'usuarios#create'
  get    'usuarios/new',      to: 'usuarios#new',     as: :new_usuario
  get    'usuarios/:id/edit', to: 'usuarios#edit',    as: :edit_usuario
  get    'usuarios/:id',      to: 'usuarios#show',    as: :usuario
  put    'usuarios/:id',      to: 'usuarios#update'
  delete 'usuarios/:id',      to: 'usuarios#destroy', as: :destroy_usuario
end

  # Generos
  get    "generos"          => "generos#index",   :as => :generos
  post   "generos"          => "generos#create"
  get    "generos/new"      => "generos#new",     :as => :new_genero
  get    "generos/:id/edit" => "generos#edit",    :as => :edit_genero
  get    "generos/:id"      => "generos#show",    :as => :genero
  put    "generos/:id"      => "generos#update"
  delete "generos/:id"      => "generos#destroy"

end
