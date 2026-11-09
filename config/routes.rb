Biblioteca::Application.routes.draw do

  root to: "livros#index"

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

  # Livros
  get    "livros"          => "livros#index",   :as => :livros
  post   "livros"          => "livros#create"
  get    "livros/new"      => "livros#new",     :as => :new_livro
  get    "livros/:id"      => "livros#show",    :as => :livro
  get    "livros/:id/edit" => "livros#edit",    :as => :edit_livro
  put    "livros/:id"      => "livros#update"
  delete "livros/:id"      => "livros#destroy"
  get    "livros/:id/info" => "livros#info",    :as => :info_livro

  # Empréstimos
  get    "emprestimos"          => "emprestimos#index",   :as => :emprestimos
  post   "emprestimos"          => "emprestimos#create"
  get    "emprestimos/new"      => "emprestimos#new",     :as => :new_emprestimo
  get    "emprestimos/:id"      => "emprestimos#show",    :as => :emprestimo
  get    "emprestimos/:id/edit" => "emprestimos#edit",    :as => :edit_emprestimo
  put    "emprestimos/:id"      => "emprestimos#update"
  delete "emprestimos/:id"      => "emprestimos#destroy"

  # Perfil
  get "perfil/senha" => "perfil#alterar_senha",    :as => :alterar_senha_perfil
  put "perfil/senha" => "perfil#atualizar_senha",  :as => :atualizar_senha_perfil
  get "perfil(/:id)" => "perfil#show", :as => :perfil
  

  # Reservas
  get    "reservas"          => "reservas#index",   :as => :reservas
  post   "reservas"          => "reservas#create"
  get    "reservas/new"      => "reservas#new",     :as => :new_reserva
  get    "reservas/:id"      => "reservas#show",    :as => :reserva
  put    "reservas/:id"      => "reservas#update"
  delete "reservas/:id"      => "reservas#destroy"

  # Login
  get "login" => "login#index", :as => :login
  post "login" => "login#create"
  get "logout" => "login#destroy", :as => :logout

  # Configuracao
  get "configuracao" => "configuracoes#show", :as => :configuracao
  get "configuracao/edit" => "configuracoes#edit", :as => :edit_configuracao
  put "configuracao" => "configuracoes#update"

end
