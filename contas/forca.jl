function converter_forca(numero, unidade_origem, unidade_destino)
    # Definindo fatores de conversão para as unidades conhecidas
    N_to_kgf = 0.101972
    N_to_dyn = 1e5
    N_to_lbf = 0.224809

    # Realizando a conversão
    forca_em_unidade_origem = 
        if unidade_origem == "Newton"
            numero
        elseif unidade_origem == "Quilograma força"
            numero / N_to_kgf
        elseif unidade_origem == "Dina"
            numero / N_to_dyn
        elseif unidade_origem == "Libra-força"
            numero / N_to_lbf
        else
            return "Unidade de força de origem não suportada"
        end

    # Convertendo para a unidade de destino
    resultado = 
        if unidade_destino == "Newton"
            forca_em_unidade_origem
        elseif unidade_destino == "Quilograma força"
            forca_em_unidade_origem * N_to_kgf
        elseif unidade_destino == "Dina"
            forca_em_unidade_origem * N_to_dyn
        elseif unidade_destino == "Libra-força"
            forca_em_unidade_origem * N_to_lbf
        else
            return "Unidade de força de destino não suportada"
        end

    return resultado
end