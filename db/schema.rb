# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20261030163907) do

  create_table "autores", :force => true do |t|
    t.string   "nome"
    t.date     "data_nasc"
    t.date     "data_obito"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "emprestimos", :force => true do |t|
    t.integer  "livro_id"
    t.integer  "usuario_id"
    t.datetime "data_prevista_devolucao"
    t.datetime "data_devolucao"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "generos", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "livros", :force => true do |t|
    t.string   "titulo"
    t.string   "sinopse"
    t.integer  "ano_publicacao"
    t.integer  "qtd_paginas"
    t.integer  "autor_id"
    t.integer  "genero_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "reservas", :force => true do |t|
    t.integer  "usuario_id",     :null => false
    t.integer  "livro_id",       :null => false
    t.date     "data_reserva"
    t.integer  "posicao"
    t.date     "data_expiracao"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "usuarios", :force => true do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "login"
    t.string   "senha"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
