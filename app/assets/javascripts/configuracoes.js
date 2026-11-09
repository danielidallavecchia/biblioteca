

var texto = $("#cfg-texto-reserva");

var ativo = "(está ativo)";
var inativo = "(está inativo)";
var i = 0;

function muda_texto_configuracao(esta_ativa) {
    if (i == 0) {
        // estado inicial apenas
        if (esta_ativa) { 
            texto = ativo;
        } else {
            texto = inativo;
        }
    }

    if (texto === ativo) {
        texto = inativo;
    } else {
        texto = ativo;
    }
    
    console.log("texto = ", texto)
    document.getElementById("cfg-texto-reserva").textContent = texto;
    i += 1;
}
