Biblioteca::Application.routes.draw do
  # Usuarios
  get    'usuarios',          to: 'usuarios#index',   as: :usuarios
  post   'usuarios',          to: 'usuarios#create'
  get    'usuarios/new',      to: 'usuarios#new',     as: :new_usuario
  get    'usuarios/:id/edit', to: 'usuarios#edit',    as: :edit_usuario
  get    'usuarios/:id',      to: 'usuarios#show',    as: :usuario
  put    'usuarios/:id',      to: 'usuarios#update'
  delete 'usuarios/:id',      to: 'usuarios#destroy'

  # Generos
  get    "generos"          => "generos#index",   :as => :generos
  post   "generos"          => "generos#create"
  get    "generos/new"      => "generos#new",     :as => :new_genero
  get    "generos/:id/edit" => "generos#edit",    :as => :edit_genero
  get    "generos/:id"      => "generos#show",    :as => :genero
  put    "generos/:id"      => "generos#update"
  delete "generos/:id"      => "generos#destroy"

  # Autores
  get    "autores"          => "autores#index",   :as => :autores
  post   "autores"          => "autores#create"
  get    "autores/new"      => "autores#new",     :as => :new_autor
  get    "autores/:id"      => "autores#show",    :as => :autor
  get    "autores/:id/edit" => "autores#edit",    :as => :edit_autor
  put    "autores/:id"      => "autores#update"
  delete "autores/:id"      => "autores#destroy"

end
