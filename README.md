# Biblioteca
Sistema de gerencimaneto de biblioteca com Ruby on Rails.

### Comandos úteis - Docker

```docker compose down```   
```docker compose up```    
```docker compose up --build```    


## Requisitos
- Deve conter CRUD de usuários, autores, gêneros, livros
- Deve conter empréstimos e reservas
- Deve conter a aba "Meu perfil", que lista meus emprestimos e reservas
- Deve ter login e autenticação de sessão
- Listas devem ter filtro de busca por texto

## Relacionamentos
- livro 1:n emprestimos
- livro 1:n reservas
- livro 1:1 genero
- livro 1:1 autor
- emprestimo 1:1 livro
- emprestimo 1:1 usuario
- reserva 1:1 livro
- reserva 1:1 usuario

#### Descrição:
- um gênero tem muitos livros.
- um autor pode ter muitos livros.
- um livro pertence a somente um autor.
- um livro pertence a somente um gênero.
- um livro pode ter muitos empréstimos e muitas reservas.
- Um empréstimo pertence a um usuário.
- Um empréstimo pertence a um livro.
- Uma reserva pertence a um livro.
- Uma reserva pertence a um usuário.
- um usuário tem muitas reservas.
- um usuário tem muitos empréstimos.

## Fluxos

#### Emprestar
- Um livro só pode ser emprestado para um usuário por vez
- Após criado, um emprestimo nao pode ser editado
- Somente emprestimos encerrados podem ser excluídos
- Ao devolver um emprestimo, se houver reserva ativa permite criar um novo empréstimo automaticamente (é configurável pelo meu perfil)

#### Reservar
- Só permite criar reservas para livros com emprestimo ativo
- Não permite reservar se já estiver reservado pro mesmo usuario
- Não permite reservar se já estiver emprestado pro mesmo usuario
- Ao encerrar ou excluir uma reserva, as posições são recalculadas

