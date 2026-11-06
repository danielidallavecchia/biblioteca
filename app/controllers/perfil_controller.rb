class PerfilController < ApplicationController
  def show
    @usuario = Usuario.find_by_id(params[:id]) ||
               Usuario.find_by_id(session[:usuario_id]) ||
               Usuario.first
  end

  def alterar_senha
    @usuario = usuario_atual
    redirect_to perfil_path, alert: "Usuário não encontrado." unless @usuario
  end

  def atualizar_senha
    @usuario = usuario_atual
    return redirect_to(perfil_path, alert: "Usuário não encontrado.") unless @usuario

    if @usuario.senha != params[:senha_atual]
      @erro = "A senha atual está incorreta."
    elsif params[:nova_senha].blank?
      @erro = "Informe a nova senha."
    elsif params[:nova_senha] != params[:confirmacao_senha]
      @erro = "A confirmação não confere com a nova senha."
    else
      @usuario.senha = params[:nova_senha]
      if @usuario.save
        redirect_to perfil_path, notice: "Senha alterada com sucesso."
        return
      end
      @erro = @usuario.errors.full_messages.first
    end

    render :alterar_senha
  end

  private

  def usuario_atual
    Usuario.find_by_id(session[:usuario_id]) || Usuario.first
  end
end