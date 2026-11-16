
var $css_popup = "popup-sweetalert"
var $css_confirm =" botao-confirmar-sweetalert"
var $css_titulo = "titulo-sweetalert"
var $css_icone = "icone-sweetalert"

var mensagens = {
    autor_em_uso: {
        title: "Autor em uso não pode ser excluído",
        customClass: {
            popup: $css_popup,
            confirmButton: $css_confirm,
            title: $css_titulo,
            icon: $css_icone
        }
    },
    genero_em_uso: {
        title: "Gênero em uso não pode ser excluído",
        customClass: {
            popup: $css_popup,
            confirmButton: $css_confirm,
            title: $css_titulo,
            icon: $css_icone
        }
    },
    livro_em_uso_emprestimo: {
        title: "Livro emprestado não pode ser excluído",
        customClass: {
            popup: $css_popup,
            confirmButton: $css_confirm,
            title: $css_titulo,
            icon: $css_icone
        }
    },
    livro_em_uso_reserva: {
        title: "Livro reservado não pode ser excluído",
        customClass: {
            popup: $css_popup,
            confirmButton: $css_confirm,
            title: $css_titulo,
            icon: $css_icone
        }
    }
}

function alerta(chave) {
    console.log("chave = ", chave)

    if (!mensagens[chave]) {
        return;
    }

    Swal.fire(mensagens[chave]);

    $("#alerta").attr("data-alerta").textContent = "";
    $("#alerta").attr("data-alerta", "");
}

$(function() {
    var chave = $("#alerta").attr("data-alerta");

    if (chave) {
        alerta(chave);
    }
});

