function converter_velocidade(numero, unidade_origem, unidade_destino)
    # Realizando a conversão
    velocidade_em_unidade_origem = 
        if unidade_origem == "Quilômetro por hora"
            numero
        elseif unidade_origem == "Metro por segundo"
            numero * 3.6
        elseif unidade_origem == "Quilômetro por segundo"
            numero * 3600
        elseif unidade_origem == "Pé por segundo"
            numero * 1.09728
        elseif unidade_origem == "Milha por hora"
            numero * 1.60934
        elseif unidade_origem == "Milha por segundo"
            numero * 5793.64
        else
            return "Unidade de velocidade de origem não suportada"
        end

    # Convertendo para a unidade de destino
    resultado = 
        if unidade_destino == "Quilômetro por hora"
            velocidade_em_unidade_origem
        elseif unidade_destino == "Metro por segundo"
            velocidade_em_unidade_origem / 3.6
        elseif unidade_destino == "Quilômetro por segundo"
            velocidade_em_unidade_origem / 3600
        elseif unidade_destino == "Pé por segundo"
            velocidade_em_unidade_origem / 1.09728
        elseif unidade_destino == "Milha por hora"
            velocidade_em_unidade_origem / 1.60934
        elseif unidade_destino == "Milha por segundo"
            velocidade_em_unidade_origem / 5793.64
        else
            return "Unidade de velocidade de destino não suportada"
        end

    return resultado
end
