module TransacaoHelper
  module Gerador
    def self.codigo_alphanumerico(params)
      return false unless validar_parametros_codigo_alphanumerico(params)

      date = DateTime.now.strftime('%Y%m%d%H%M%S').to_s
      conta_origem_id = params[:conta_origem_id].to_s
      conta_destino_id = params[:conta_destino_id].to_s
      tipo = params[:tipo].to_s

      Digest::MD5.hexdigest(date + conta_origem_id + tipo + conta_destino_id)
    end

    private

      def self.validar_parametros_codigo_alphanumerico(params)
        return false unless params[:conta_origem_id].is_a?(Integer)
        return false unless params[:conta_destino_id].is_a?(Integer) || params[:conta_destino_id].blank?

        return false unless Transacao.tipos.keys.include?(params[:tipo])
        true
      end
  end
end