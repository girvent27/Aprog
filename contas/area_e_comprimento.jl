
function converter_area(numero, unidade_origem, unidade_destino)
    # Definindo fatores de conversão para as unidades conhecidas
    km2_to_m2 = 1e6
    ha_to_m2 = 1e4
    a_to_m2 = 1e2
    dm2_to_m2 = 1e-2
    cm2_to_m2 = 1e-4
    mm2_to_m2 = 1e-6
    in2_to_m2 = 0.00064516
    ft2_to_m2 = 0.092903
    yd2_to_m2 = 0.836127
    rod_to_m2 = 25.2929
    rood_to_m2 = 1011.71
    ac_to_m2 = 4046.86
    homestead_to_m2 = 647497
    mi2_to_m2 = 2.59e6
    legua_to_m2 = 2.59e6

    # Realizando a conversão
    area_em_metros_quadrados = 
        if unidade_origem == "quilômetro quadrado"
            numero * km2_to_m2
        elseif unidade_origem == "hectare"
            numero * ha_to_m2
        elseif unidade_origem == "are"
            numero * a_to_m2
        elseif unidade_origem == "metro quadrado"
            numero
        elseif unidade_origem == "decímetro quadrado"
            numero * dm2_to_m2
        elseif unidade_origem == "centímetro quadrado"
            numero * cm2_to_m2
        elseif unidade_origem == "milímetro quadrado"
            numero * mm2_to_m2
        elseif unidade_origem == "polegada quadrada"
            numero * in2_to_m2
        elseif unidade_origem == "pé quadrado"
            numero * ft2_to_m2
        elseif unidade_origem == "jarda quadrada"
            numero * yd2_to_m2
        elseif unidade_origem == "rod quadrado"
            numero * rod_to_m2
        elseif unidade_origem == "rood"
            numero * rood_to_m2
        elseif unidade_origem == "acre"
            numero * ac_to_m2
        elseif unidade_origem == "homestead"
            numero * homestead_to_m2
        elseif unidade_origem == "milha quadrada"
            numero * mi2_to_m2
        elseif unidade_origem == "légua quadrada"
            numero * legua_to_m2
        else
            return
        end

    # Convertendo para a unidade de destino
    resultado = 
        if unidade_destino == "quilômetro quadrado"
            area_em_metros_quadrados / km2_to_m2
        elseif unidade_destino == "hectare"
            area_em_metros_quadrados / ha_to_m2
        elseif unidade_destino == "are"
            area_em_metros_quadrados / a_to_m2
        elseif unidade_destino == "metro quadrado"
            area_em_metros_quadrados
        elseif unidade_destino == "decímetro quadrado"
            area_em_metros_quadrados / dm2_to_m2
        elseif unidade_destino == "centímetro quadrado"
            area_em_metros_quadrados / cm2_to_m2
        elseif unidade_destino == "milímetro quadrado"
            area_em_metros_quadrados / mm2_to_m2
        elseif unidade_destino == "polegada quadrada"
            area_em_metros_quadrados / in2_to_m2
        elseif unidade_destino == "pé quadrado"
            area_em_metros_quadrados / ft2_to_m2
        elseif unidade_destino == "jarda quadrada"
            area_em_metros_quadrados / yd2_to_m2
        elseif unidade_destino == "rod quadrado"
            area_em_metros_quadrados / rod_to_m2
        elseif unidade_destino == "rood"
            area_em_metros_quadrados / rood_to_m2
        elseif unidade_destino == "acre"
            area_em_metros_quadrados / ac_to_m2
        elseif unidade_destino == "homestead"
            area_em_metros_quadrados / homestead_to_m2
        elseif unidade_destino == "milha quadrada"
            area_em_metros_quadrados / mi2_to_m2
        elseif unidade_destino == "légua quadrada"
            area_em_metros_quadrados / legua_to_m2
        else
            return
        end

    return resultado
end


function converter_comprimento(numero, unidade_origem, unidade_destino)
    # Definindo fatores de conversão para as unidades conhecidas
    km_to_m = 1e3
    hm_to_m = 1e2
    dam_to_m = 1e1
    m_to_m = 1
    dm_to_m = 1e-1
    cm_to_m = 1e-2
    mm_to_m = 1e-3
    in_to_m = 0.0254
    ft_to_m = 0.3048
    yd_to_m = 0.9144
    rod_to_m = 5.0292
    furlong_to_m = 201.168
    corrente_to_m = 79.2
    mil_to_m = 1609.34
    mi_to_m = 1609.34
    legua_to_m = 4828.03

    # Realizando a conversão
    comprimento_em_metros = 
        if unidade_origem == "quilômetro"
            numero * km_to_m
        elseif unidade_origem == "hectômetro"
            numero * hm_to_m
        elseif unidade_origem == "decâmetro"
            numero * dam_to_m
        elseif unidade_origem == "metro"
            numero * m_to_m
        elseif unidade_origem == "decímetro"
            numero * dm_to_m
        elseif unidade_origem == "centímetro"
            numero * cm_to_m
        elseif unidade_origem == "milímetro"
            numero * mm_to_m
        elseif unidade_origem == "polegada"
            numero * in_to_m
        elseif unidade_origem == "pé"
            numero * ft_to_m
        elseif unidade_origem == "jarda"
            numero * yd_to_m
        elseif unidade_origem == "rod"
            numero * rod_to_m
        elseif unidade_origem == "furlong"
            numero * furlong_to_m
        elseif unidade_origem == "corrente"
            numero * corrente_to_m
        elseif unidade_origem == "mil"
            numero * mil_to_m
        elseif unidade_origem == "milha"
            numero * mi_to_m
        elseif unidade_origem == "légua"
            numero * legua_to_m
        else
            return 
        end

    # Convertendo para a unidade de destino
    resultado = 
        if unidade_destino == "quilômetro"
            comprimento_em_metros / km_to_m
        elseif unidade_destino == "hectômetro"
            comprimento_em_metros / hm_to_m
        elseif unidade_destino == "decâmetro"
            comprimento_em_metros / dam_to_m
        elseif unidade_destino == "metro"
            comprimento_em_metros / m_to_m
        elseif unidade_destino == "decímetro"
            comprimento_em_metros / dm_to_m
        elseif unidade_destino == "centímetro"
            comprimento_em_metros / cm_to_m
        elseif unidade_destino == "milímetro"
            comprimento_em_metros / mm_to_m
        elseif unidade_destino == "polegada"
            comprimento_em_metros / in_to_m
        elseif unidade_destino == "pé"
            comprimento_em_metros / ft_to_m
        elseif unidade_destino == "jarda"
            comprimento_em_metros / yd_to_m
        elseif unidade_destino == "rod"
            comprimento_em_metros / rod_to_m
        elseif unidade_destino == "furlong"
            comprimento_em_metros / furlong_to_m
        elseif unidade_destino == "corrente"
            comprimento_em_metros / corrente_to_m
        elseif unidade_destino == "mil"
            comprimento_em_metros / mil_to_m
        elseif unidade_destino == "milha"
            comprimento_em_metros / mi_to_m
        elseif unidade_destino == "légua"
            comprimento_em_metros / legua_to_m
        else
            return
        end

    return resultado
end