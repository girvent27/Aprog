function converter_volume_solido(numero, unidade_origem, unidade_destino)
    # Realizando a conversão
    volume_em_unidade_origem = 
        if unidade_origem == "Quilômetro cúbico"
            numero
        elseif unidade_origem == "Hectômetro cúbico"
            numero * 1e6
        elseif unidade_origem == "Decâmetro cúbico"
            numero * 1e3
        elseif unidade_origem == "Metro cúbico"
            numero * 1
        elseif unidade_origem == "Decímetro cúbico"
            numero * 1e-3
        elseif unidade_origem == "Polegada cúbica"
            numero * (0.0254^3)
        elseif unidade_origem == "Pé cúbico"
            numero * (0.3048^3)
        elseif unidade_origem == "Jarda cúbica"
            numero * (0.9144^3)
        elseif unidade_origem == "Acre-pé"
            numero * (1233.48)
        elseif unidade_origem == "Milha cúbica"
            numero * (1609.34^3)
        else
            return "Unidade de volume sólido de origem não suportada"
        end

    # Convertendo para a unidade de destino
    resultado = 
        if unidade_destino == "Quilômetro cúbico"
            volume_em_unidade_origem
        elseif unidade_destino == "Hectômetro cúbico"
            volume_em_unidade_origem / 1e6
        elseif unidade_destino == "Decâmetro cúbico"
            volume_em_unidade_origem / 1e3
        elseif unidade_destino == "Metro cúbico"
            volume_em_unidade_origem / 1
        elseif unidade_destino == "Decímetro cúbico"
            volume_em_unidade_origem / 1e-3
        elseif unidade_destino == "Polegada cúbica"
            volume_em_unidade_origem / (0.0254^3)
        elseif unidade_destino == "Pé cúbico"
            volume_em_unidade_origem / (0.3048^3)
        elseif unidade_destino == "Jarda cúbica"
            volume_em_unidade_origem / (0.9144^3)
        elseif unidade_destino == "Acre-pé"
            volume_em_unidade_origem / (1233.48)
        elseif unidade_destino == "Milha cúbica"
            volume_em_unidade_origem / (1609.34^3)
        else
            return "Unidade de volume sólido de destino não suportada"
        end

    return resultado
end
function converter_volume_liq(numero, unidade_origem, unidade_destino)
    # Realizando a conversão
    volume_em_unidade_origem = 
        if unidade_origem == "Quilolitro"
            numero
        elseif unidade_origem == "Hectolitro"
            numero * 100
        elseif unidade_origem == "Decalitro"
            numero * 10
        elseif unidade_origem == "Litro"
            numero * 1
        elseif unidade_origem == "Decilitro"
            numero * 0.1
        elseif unidade_origem == "barril"
            numero * 119.24
        elseif unidade_origem == "galão"
            numero * 3.78541
        elseif unidade_origem == "quarto"
            numero * 0.946353
        elseif unidade_origem == "pinto"
            numero * 0.473176
        elseif unidade_origem == "gill"
            numero * 0.118294
        elseif unidade_origem == "onça líquida ou fluida"
            numero * 0.0295735
        elseif unidade_origem == "dracma líquido ou fluido"
            numero * 0.00369669
        elseif unidade_origem == "minim"
            numero * 0.0000616115
        else
            return "Unidade de volume líquido de origem não suportada"
        end

    # Convertendo para a unidade de destino
    resultado = 
        if unidade_destino == "Quilolitro"
            volume_em_unidade_origem
        elseif unidade_destino == "Hectolitro"
            volume_em_unidade_origem / 100
        elseif unidade_destino == "Decalitro"
            volume_em_unidade_origem / 10
        elseif unidade_destino == "Litro"
            volume_em_unidade_origem / 1
        elseif unidade_destino == "Decilitro"
            volume_em_unidade_origem / 0.1
        elseif unidade_destino == "barril"
            volume_em_unidade_origem / 119.24
        elseif unidade_destino == "galão"
            volume_em_unidade_origem / 3.78541
        elseif unidade_destino == "quarto"
            volume_em_unidade_origem / 0.946353
        elseif unidade_destino == "pinto"
            volume_em_unidade_origem / 0.473176
        elseif unidade_destino == "gill"
            volume_em_unidade_origem / 0.118294
        elseif unidade_destino == "onça líquida ou fluida"
            volume_em_unidade_origem / 0.0295735
        elseif unidade_destino == "dracma líquido ou fluido"
            volume_em_unidade_origem / 0.00369669
        elseif unidade_destino == "minim"
            volume_em_unidade_origem / 0.0000616115
        else
            return "Unidade de volume líquido de destino não suportada"
        end

    return resultado
end