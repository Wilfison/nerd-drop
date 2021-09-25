# frozen_string_literal: true

# Helpers de ajuda para exibir dados nas viewa
module StringHelper
  include ActionView::Helpers::NumberHelper

  # Formata data ou retorna string vazia caso nao receba uma valor
  def format_date(data, mascara = '%d/%m/%Y', blank_value = '-')
    return blank_value if data.blank?

    data.to_date.in_time_zone.strftime(mascara)
  end

  # Formata data ou retorna string vazia caso nao receba uma valor
  def format_datetime(data, mascara = '%d/%m/%Y às %H:%Mh', blank_value = '-')
    return blank_value if data.blank?

    data.in_time_zone.strftime(mascara)
  end

  # Formata booleano para SIM|NAO
  def format_boolean(valor)
    t("booleans.#{valor}")
  end

end
