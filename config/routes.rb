Biblioteca::Application.routes.draw do

  root to: "livros#index"

  # Usuarios
  get    "usuarios",                       to:"usuarios#index",                 as:    :usuarios
  post   "usuarios",                       to:"usuarios#create"
  get    "usuarios/new",                   to:"usuarios#new",                   as:    :new_usuario
  get    "usuarios/:id/edit",              to:"usuarios#edit",                  as:    :edit_usuario
  get    "usuarios/:id",                   to:"usuarios#show",                  as:    :usuario
  put    "usuarios/:id",                   to:"usuarios#update"
  delete "usuarios/:id",                   to:"usuarios#destroy"
  get    "usuarios/:id/gera_senha",        to:"usuarios#gera_senha",            as:    :gera_senha_usuario

  # Generos
  get    "generos",                        to:"generos#index",                  as:    :generos
  post   "generos",                        to:"generos#create"
  get    "generos/new",                    to:"generos#new",                    as:    :new_genero
  get    "generos/:id/edit",               to:"generos#edit",                   as:    :edit_genero
  get    "generos/:id",                    to:"generos#show",                   as:    :genero
  put    "generos/:id",                    to:"generos#update"
  delete "generos/:id",                    to:"generos#destroy"

  # Autores
  get    "autores",                        to:"autores#index",                  as:    :autores
  post   "autores",                        to:"autores#create"
  get    "autores/new",                    to:"autores#new",                    as:    :new_autor
  get    "autores/:id",                    to:"autores#show",                   as:    :autor
  get    "autores/:id/edit",               to:"autores#edit",                   as:    :edit_autor
  put    "autores/:id",                    to:"autores#update"
  delete "autores/:id",                    to:"autores#destroy"

  # Livros
  get    "livros",                         to:"livros#index",                   as:    :livros
  post   "livros",                         to:"livros#create"
  get    "livros/new",                     to:"livros#new",                     as:    :new_livro
  get    "livros/:id",                     to:"livros#show",                    as:    :livro
  get    "livros/:id/edit",                to:"livros#edit",                    as:    :edit_livro
  put    "livros/:id",                     to:"livros#update"
  delete "livros/:id",                     to:"livros#destroy"
  get    "livros/:id/info",                to:"livros#info",                    as:    :info_livro

  # Empréstimos
  get    "emprestimos",                    to:"emprestimos#index",              as:    :emprestimos
  post   "emprestimos",                    to:"emprestimos#create"
  get    "emprestimos/new",                to:"emprestimos#new",                as:    :new_emprestimo
  get    "emprestimos/:id",                to:"emprestimos#show",               as:    :emprestimo
  get    "emprestimos/:id/edit",           to:"emprestimos#edit",               as:    :edit_emprestimo
  put    "emprestimos/:id",                to:"emprestimos#update"
  delete "emprestimos/:id",                to:"emprestimos#destroy"

  # Perfil
  get    "perfil/senha",                   to:"perfil#alterar_senha",           as:    :alterar_senha_perfil
  put    "perfil/senha",                   to:"perfil#atualizar_senha",         as:    :atualizar_senha_perfil
  get    "perfil(/:id)",                   to:"perfil#show",                    as:    :perfil
  

  # Reservas
  get    "reservas",                       to:"reservas#index",                 as:    :reservas
  post   "reservas",                       to:"reservas#create"
  get    "reservas/new",                   to:"reservas#new",                   as:    :new_reserva
  get    "reservas/:id",                   to:"reservas#show",                  as:    :reserva
  put    "reservas/:id",                   to:"reservas#update"
  delete "reservas/:id",                   to:"reservas#destroy"

  # Login
  get    "login",                          to:"login#index",                    as:    :login
  post   "login",                          to:"login#create"
  get    "logout",                         to:"login#destroy",                  as:    :logout

  # Configuracao
  get    "configuracao",                   to:"configuracoes#show",             as:    :configuracao
  get    "configuracao/edit",              to:"configuracoes#edit",             as:    :edit_configuracao
  put    "configuracao",                   to:"configuracoes#update"

  # Usuarios perfis
  get    "usuario_perfis",                 to:"usuario_perfis#index",           as:    :usuario_perfis
  post   "usuario_perfis",                 to:"usuario_perfis#create"
  get    "usuario_perfis/new",             to:"usuario_perfis#new",             as:    :new_usuario_perfil
  get    "usuario_perfis/:id/edit",        to:"usuario_perfis#edit",            as:    :edit_usuario_perfil
  get    "usuario_perfis/:id",             to:"usuario_perfis#show",            as:    :usuario_perfil
  put    "usuario_perfis/:id",             to:"usuario_perfis#update"
  delete "usuario_perfis/:id",             to:"usuario_perfis#destroy"
  get    "usuario_perfis/padrao/alterar",  to:"usuario_perfis#altera_padrao",   as:    :altera_padrao_usuario_perfil
  put    "usuario_perfis/padrao/alterar",  to:"usuario_perfis#atualiza_padrao", as:    :atualiza_padrao_usuario_perfil

end
