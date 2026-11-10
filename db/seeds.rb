# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

###########################################
# usuarios

Usuario.create([
  {
    # 1
    :nome => "Administrador da Silva",
    :email => "admin@gmail.com",
    :login => "admin",
    :senha => "admin123"
  },
  {
    # 2
    :nome => "Danieli N. Dalla Vecchia",
    :email => "danieli@gmail.com",
    :login => "danieli",
    :senha => "admin123"
  },
  {
    # 3
    :nome => "Felipe Lima",
    :email => "felipe@gmail.com",
    :login => "felipe",
    :senha => "admin123"
  }
])

###########################################
# generos 
Genero.create([
  # 1
  { :nome => "Distopia" }, 
  # 2 
  { :nome => "Ficção científica" }, 
  # 3
  { :nome => "Fantasia" }, 
  # 4
  { :nome => "Terror / Horror" }, 
  # 5
  { :nome => "Suspense / Mistério" }, 
  # 6
  { :nome => "Drama" }, 
  # 7
  { :nome => "Conto" }, 
  # 8
  { :nome => "Ficção Policial" }, 
  # 9
  { :nome => "Ação / Aventura" }, 
  # 10
  { :nome => "Ficção Histórica" }, 
  # 11
  { :nome => "Biografia" },
  # 12
  { :nome => "Autobiografia" },
  # 13
  { :nome => "Técnico-científico" },
  # 14
  { :nome => "Jornalismo" }
])

###########################################
# autores
Autor.create([
  {
    # 1
    :nome => "Ana Paula Maia",
    :data_nasc => "1977-12-09",
    :data_obito => nil
  },
  {
    # 2
    :nome => "Conceição Evaristo",
    :data_nasc => "1946-11-29",
    :data_obito => nil
  },
  {
    # 3
    :nome => "Margaret Atwood",
    :data_nasc => "1939-11-18",
    :data_obito => nil
  },
  {
    # 4
    :nome => "Itamar Vieira Junior",
    :data_nasc => "1979-08-06",
    :data_obito => nil
  },
  {
    # 5
    :nome => "Graciliano Ramos",
    :data_nasc => "1892-10-27",
    :data_obito => "1953-03-20"
  },
  {
    # 6
    :nome => "Jorge Amado",
    :data_nasc => "1912-08-10",
    :data_obito => "2001-08-06"
  },
  {
    # 7
    :nome => "Machado de Assis",
    :data_nasc => "1839-06-21",
    :data_obito => "1908-09-29"
  },
  {
    # 8
    :nome => "Clarice Lispector",
    :data_nasc => "1920-12-10",
    :data_obito => "1977-12-9"
  },
  {
    # 9
    :nome => " Ana Maria Gonçalves",
    :data_nasc => "1970-12-05",
    :data_obito => nil
  },
  {
    # 10
    :nome => "Maria Firmina dos Reis",
    :data_nasc => "1822-03-11",
    :data_obito => "1917-11-11"
  },
  {
    # 11
    :nome => "Mário de Andrade",
    :data_nasc => "1893-10-09",
    :data_obito => "1945-02-25"
  },
  {
    # 12 
    :nome => "João Guimarães Rosa",
    :data_nasc => "",
    :data_obito => ""
  },
  {
    # 13
    :nome => "Carlos Drummond de Andrade",
    :data_nasc => "",
    :data_obito => ""
  },
  {
    # 14
    :nome => "Carolina Maria de Jesus",
    :data_nasc => "",
    :data_obito => ""
  },
  {
    # 15
    :nome => "Ariano Suassuna",
    :data_nasc => "",
    :data_obito => ""
  },
  {
    # 16
    :nome => "Milton Hatoum",
    :data_nasc => "",
    :data_obito => ""
  },
  {
    # 17
    :nome => "José de Alencar",
    :data_nasc => "",
    :data_obito => ""
  },
  {
    # 18
    :nome => "Cecília Meireles",
    :data_nasc => "",
    :data_obito => ""
  }
])

###########################################
# livros

Livro.create([
  {
    # 1
    :titulo => "Enterre seus mortos",
    :sinopse => "A obra acomanha Edgar Wilson, um homem que trabalha removendo animais atropelados nas rodovias da cidade fictícia de Abalurdes. Enquanto o mundo ao redor dá sinais de um fim/arrebatamento iminente, Edgar se vê forçado a quebrar as regras de seu ofício.",
    :ano_publicacao => 2018,
    :qtd_paginas => 136,
    :autor_id => 1,
    :genero_id => 1,
    :imagem_url => "https://m.media-amazon.com/images/I/914sM98HUAL.jpg"
  },
  {
    # 2
    :titulo => "Búfalos selvagens",
    :sinopse => "Edgar Wilson deixa para trás o trabalho de coletor de cadáveres nas estradas. Ele retorna às suas origens no Matadouro do Milo, agora comandado por sua esposa, Rosário. Circo das Revelações.",
    :ano_publicacao => 2024,
    :qtd_paginas => 203,
    :autor_id => 1,
    :genero_id => 10,
    :imagem_url => "https://m.media-amazon.com/images/I/81mEFzYPcSL.jpg"
  },
  {
    # 3
    :titulo => "Assim na terra como em baixo da terra",
    :sinopse => "O romance narra o cotidiano de uma colônia penal isolada e em vias de desativação, construída sobre um terreno com um histórico sombrio de tortura e assassinato.",
    :ano_publicacao => 2017,
    :qtd_paginas => 143,
    :autor_id => 1,
    :genero_id => 5,
    :imagem_url => "https://m.media-amazon.com/images/I/915GvEbmRjL._AC_UF1000,1000_QL80_.jpg"
  },
  {
    # 4
    :titulo => "Becos da Memória",
    :sinopse => "É um romance memorialista que retrata a vida cotidiana, os afetos e as dores de uma comunidade periférica na região central de Belo Horizonte ameaçada pela remoção forçada.",
    :ano_publicacao => 2006,
    :qtd_paginas => 132,
    :autor_id => 2,
    :genero_id => 10,
    :imagem_url => "https://m.media-amazon.com/images/I/81rKkgH1vgL.jpg"
  },
  {
    # 5
    :titulo => "Olhos d'água",
    :sinopse => "Narrado em primeira pessoa, uma filha reflete sobre a própria origem e percebe que não lembra a cor dos olhos da mãe. Ao reencontrá-la, reconhece no olhar materno 'águas correntes' cheias de lágrimas e história.",
    :ano_publicacao => 2014,
    :qtd_paginas => 116,
    :autor_id => 2,
    :genero_id => 6,
    :imagem_url => "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-NhWj3nlaKnWD1n59gnFKfgp3o3qQn7MidTJgELQcBw&s=10"
  },
  {
    # 6
    :titulo => "Ponciá Vicêncio",
    :sinopse => "Ponciá cresce no meio rural ao lado da mãe e do irmão. Descontente com a vida no campo, ela pega um trem rumo à cidade grande, iniciando sua trajetória em busca de sua identidade e de um lugar no mundo.",
    :ano_publicacao => 2003,
    :qtd_paginas => 298,
    :autor_id => 2,
    :genero_id => 2,
    :imagem_url => "https://m.media-amazon.com/images/I/81EULWTz2PL._AC_UF1000,1000_QL80_.jpg"
  },
  {
    # 7
    :titulo => "Canção para Ninar Menino Grande",
    :sinopse => "O livro  narra a história de Fio Jasmim, um homem negro que trabalha como maquinista de trem, e explora os impactos de sua vida afetiva sobre as diversas mulheres com quem se relaciona ao longo dos anos.",
    :ano_publicacao => 2018,
    :qtd_paginas => 177,
    :autor_id => 2,
    :genero_id => 3,
    :imagem_url => "https://m.media-amazon.com/images/I/61u-HWzo8nL.jpg"
  },
  {
    # 8
    :titulo => "O conto da aia",
    :sinopse => "Diante de uma crise global de infertilidade causada por poluição e radiação, o novo regime teocrático e totalitário assume o controle total da sociedade. Os direitos civis são extintos e a liberdade de expressão é eliminada.",
    :ano_publicacao => 1985,
    :qtd_paginas => 401,
    :autor_id => 3,
    :genero_id => 1,
    :imagem_url => "https://m.media-amazon.com/images/I/91AHNAr638L._AC_UF1000,1000_QL80_.jpg"
  },
  {
    # 9
    :titulo => "Torto Arado",
    :sinopse => "Nas profundezas do sertão baiano, as irmãs Bibiana e Belonísia encontram uma velha e misteriosa faca na mala guardada sob a cama da avó. Ocorre então um acidente. E para sempre suas vidas estarão ligadas a ponto de uma precisar ser a voz da outra.",
    :ano_publicacao => 2019,
    :qtd_paginas => 142,
    :autor_id => 4,
    :genero_id => 7,
    :imagem_url => "https://m.media-amazon.com/images/I/71CDcBHXuDL._AC_UF1000,1000_QL80_.jpg"
  },
  {
    # 10
    :titulo => "Vidas Secas",
    :sinopse => "É um dos romances mais importantes do Modernismo brasileiro. A obra retrata a dura realidade de uma família de retirantes no sertão nordestino, esmagada pela seca, pela miséria e pela exploração social.",
    :ano_publicacao => 1938,
    :qtd_paginas => 345,
    :autor_id => 5,
    :genero_id => 8,
    :imagem_url => "https://m.media-amazon.com/images/I/618-b9Im6dL.jpg"
  },
  {
    # 11
    :titulo => "Capitães da Areia",
    :sinopse => "A obra retrata a vida de um grupo de menores abandonados que vivem nas ruas da cidade de Salvador, abrigando-se em um trapiche e sobrevivendo por meio de pequenos furtos.",
    :ano_publicacao => 1937,
    :qtd_paginas => 230,
    :autor_id => 6,
    :genero_id => 9,
    :imagem_url => "https://m.media-amazon.com/images/I/81t7altQZxL.jpg"
  },
  {
    # 12
    :titulo => "Dona Flor e Seus Dois Maridos",
    :sinopse => "Após ficar viúva e sofrer com o luto misturado ao alívio, Flor aceita se casar com Teodoro. No entanto, a falta da intensidade do primeiro marido deixa um vazio profundo. Certa noite, o espírito do falecido retorna nu e invisível para todos, exceto para Dona Flor.",
    :ano_publicacao => 1966,
    :qtd_paginas => 333,
    :autor_id => 6,
    :genero_id => 11,
    :imagem_url => "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTof-9PNdxIUcavsiWUPVYT8D7XP7iSFhmqqda29fasAyGItFACar5cz5o&s=10"
  },
  {
    # 13
    :titulo => "Memórias Póstumas de Brás Cubas",
    :sinopse => "Por estar morto, Brás Cubas não tem papas na língua, sendo cético e sarcástico ao rever a própria vida sem a obrigação de agradar a ninguém. O livro começa pelo anúncio da sua morte e enterro, volta à infância e avança por suas lembranças.",
    :ano_publicacao => 1881,
    :qtd_paginas => 368,
    :autor_id => 7,
    :genero_id => 12,
    :imagem_url => "https://m.media-amazon.com/images/I/71OL9RU2tJL.jpg"
  },
  {
    # 14
    :titulo => "Dom Casmurro",
    :sinopse => "O livro narra as memórias de Bento Santiago (apelidado de Dom Casmurro), um homem solitário e amargurado que tenta reconstruir o passado e responder a uma dúvida que o consome: se sua esposa, Capitu, o traiu com seu melhor amigo, Escobar.",
    :ano_publicacao => 1899,
    :qtd_paginas => 232,
    :autor_id => 7,
    :genero_id => 13,
    :imagem_url => "https://m.media-amazon.com/images/I/61x1ZHomWUL.jpg"
  },
  {
    # 15
    :titulo => "O Alienista",
    :sinopse => "Dr. Simão Bacamarte, um renomado médico que estudou na Europa, retorna à sua vila natal. Obcecado pela ciência e pela mente humana, ele decide se dedicar à psiquiatria, transformando a cidade em um laboratório do estudo da loucura.",
    :ano_publicacao => 1882,
    :qtd_paginas => 101,
    :autor_id => 7,
    :genero_id => 14,
    :imagem_url => "https://m.media-amazon.com/images/I/61+cCiPBnWL.jpg"
  },
  {
    # 16
    :titulo => "A Hora da Estrela",
    :sinopse => "A obra narra a trajetória de Macabéa, uma jovem órfã e ingênua que vive no Rio de Janeiro. A história é contada por Rodrigo, um escritor fictício e onisciente que reflete sobre o ato de escrever sobre a história de uma mulher invisível.",
    :ano_publicacao => 1977,
    :qtd_paginas => 176,
    :autor_id => 8,
    :genero_id => 1,
    :imagem_url => "https://m.media-amazon.com/images/I/810Vj9zyi-L._AC_UF1000,1000_QL80_.jpg"
  },
  {
    # 17
    :titulo => "Um Defeito de Cor",
    :sinopse => "A história é narrada por Kehinde, uma mulher  idosa, cega e à beira da morte, que viaja da África de volta ao Brasil no século XIX em uma jornada desesperada para encontrar um filho perdido há décadas.",
    :ano_publicacao => 2006,
    :qtd_paginas => 234,
    :autor_id => 9,
    :genero_id => 6,
    :imagem_url => "https://m.media-amazon.com/images/I/91vUYaiay0L._UF1000,1000_QL80_.jpg"
  },
  {
    # 18
    :titulo => "Úrsula",
    :sinopse => "A história acompanha o amor trágico entre Úrsula (uma jovem pura, virtuosa e empobrecida) e Tancredo (um jovem nobre e sensível). A obra é o primeiro romance de autoria feminina e o primeiro romance abolicionista no Brasil.",
    :ano_publicacao => 1859,
    :qtd_paginas => 118,
    :autor_id => 10,
    :genero_id => 3,
    :imagem_url => "https://biblioteca.letras.ufrj.br/wp-content/uploads/2022/08/58755390._SY475_.jpg"
  },
  {
    # 19
    :titulo => "Macunaíma",
    :sinopse => "A obra acompanha o 'herói sem nenhum caráter', que viaja para São Paulo após a morte de sua mãe com o objetivo de recuperar o muiraquitã, um amuleto sagrado que foi parar nas mãos do gigante Venceslau Pietro Pietra.",
    :ano_publicacao => 1928,
    :qtd_paginas => 111,
    :autor_id => 11,
    :genero_id => 2,
    :imagem_url => "https://m.media-amazon.com/images/I/71kADstk2gL._AC_UF1000,1000_QL80_.jpg"
  }
])

###########################################
# configuracao

Configuracao.create(
  :reserva_automatica => true
)
