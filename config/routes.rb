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

  # Prefixo usado para todas as rotas
  prefixo = "/biblioteca"

  # Generos
  get    "#{prefixo}/generos"          => "generos#index",   :as => :generos
  post   "#{prefixo}/generos"          => "generos#create"
  get    "#{prefixo}/generos/new"      => "generos#new",     :as => :new_genero
  get    "#{prefixo}/generos/:id/edit" => "generos#edit",    :as => :edit_genero
  get    "#{prefixo}/generos/:id"      => "generos#show",    :as => :genero
  put    "#{prefixo}/generos/:id"      => "generos#update"
  delete "#{prefixo}/generos/:id"      => "generos#destroy"

end
