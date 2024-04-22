function converter_massa(numero, unidade_origem, unidade_destino)
    # Definindo fatores de conversão para as unidades conhecidas
    kg_to_hg = 10
    kg_to_dag = 100
    kg_to_g = 1000
    kg_to_dg = 10000
    kg_to_cg = 100000
    kg_to_mg = 1e6
    kg_to_ton_curta = 0.000984207
    kg_to_quarto_curto = 0.00220462
    kg_to_quintal_curto = 0.0220462
    kg_to_arroba = 0.0647989
    kg_to_libra_avoirdupois = 2.20462
    kg_to_onca_avoirdupois = 35.274
    kg_to_dracma_avoirdupois = 564.383
    kg_to_grao = 15432.4

    # Realizando a conversão
    massa_em_kg = 
        if unidade_origem == "quilograma"
            numero
        elseif unidade_origem == "hectograma"
            numero / kg_to_hg
        elseif unidade_origem == "decagrama"
            numero / kg_to_dag
        elseif unidade_origem == "grama"
            numero / kg_to_g
        elseif unidade_origem == "decigrama"
            numero / kg_to_dg
        elseif unidade_origem == "centigrama"
            numero / kg_to_cg
        elseif unidade_origem == "miligrama"
            numero / kg_to_mg
        elseif unidade_origem == "Tonelada curta"
            numero / kg_to_ton_curta
        elseif unidade_origem == "Quarto curto"
            numero / kg_to_quarto_curto
        elseif unidade_origem == "Quintal curto"
            numero / kg_to_quintal_curto
        elseif unidade_origem == "Arroba"
            numero / kg_to_arroba
        elseif unidade_origem == "Libra avoirdupois"
            numero / kg_to_libra_avoirdupois
        elseif unidade_origem == "Onça avoirdupois"
            numero / kg_to_onca_avoirdupois
        elseif unidade_origem == "Dracma avoirdupois"
            numero / kg_to_dracma_avoirdupois
        elseif unidade_origem == "Grão"
            numero / kg_to_grao
        else
            return "Unidade de massa de origem não suportada"
        end

    # Convertendo para a unidade de destino
    resultado = 
        if unidade_destino == "quilograma"
            massa_em_kg
        elseif unidade_destino == "hectograma"
            massa_em_kg * kg_to_hg
        elseif unidade_destino == "decagrama"
            massa_em_kg * kg_to_dag
        elseif unidade_destino == "grama"
            massa_em_kg * kg_to_g
        elseif unidade_destino == "decigrama"
            massa_em_kg * kg_to_dg
        elseif unidade_destino == "centigrama"
            massa_em_kg * kg_to_cg
        elseif unidade_destino == "miligrama"
            massa_em_kg * kg_to_mg
        elseif unidade_destino == "Tonelada curta"
            massa_em_kg * kg_to_ton_curta
        elseif unidade_destino == "Quarto curto"
            massa_em_kg * kg_to_quarto_curto
        elseif unidade_destino == "Quintal curto"
            massa_em_kg * kg_to_quintal_curto
        elseif unidade_destino == "Arroba"
            massa_em_kg * kg_to_arroba
        elseif unidade_destino == "Libra avoirdupois"
            massa_em_kg * kg_to_libra_avoirdupois
        elseif unidade_destino == "Onça avoirdupois"
            massa_em_kg * kg_to_onca_avoirdupois
        elseif unidade_destino == "Dracma avoirdupois"
            massa_em_kg * kg_to_dracma_avoirdupois
        elseif unidade_destino == "Grão"
            massa_em_kg * kg_to_grao
        else
            return "Unidade de massa de destino não suportada"
        end

    return resultado
end