function converter_pressao(numero, unidade_origem, unidade_destino)
    # Definindo fatores de conversão para as unidades conhecidas
    MPa_to_kPa = 1e3
    MPa_to_Pa = 1e6
    MPa_to_KSI = 0.145038
    MPa_to_PSI = 145.038

    kPa_to_MPa = 1e-3
    kPa_to_Pa = 1e3
    kPa_to_KSI = 0.145038
    kPa_to_PSI = 145.038

    Pa_to_MPa = 1e-6
    Pa_to_kPa = 1e-3
    Pa_to_KSI = 1.45038e-5
    Pa_to_PSI = 0.000145038

    PSI_to_MPa = 6.89476e-3
    PSI_to_kPa = 6.89476
    PSI_to_Pa = 6894.76
    PSI_to_KSI = 0.145038

    KSI_to_MPa = 6.89476e3
    KSI_to_kPa = 6.89476e6
    KSI_to_Pa = 6.89476e9
    KSI_to_PSI = 1000

    # Realizando a conversão
    pressao_em_unidade_origem = 
        if unidade_origem == "Megapascal"
            numero
        elseif unidade_origem == "Quilopascal"
            numero * kPa_to_MPa
        elseif unidade_origem == "Pascal"
            numero * Pa_to_MPa
        elseif unidade_origem == "PSI"
            numero * PSI_to_MPa
        elseif unidade_origem == "KSI"
            numero * KSI_to_MPa
        else
            return "Unidade de pressão de origem não suportada"
        end

    # Convertendo para a unidade de destino
    resultado = 
        if unidade_destino == "Megapascal"
            pressao_em_unidade_origem
        elseif unidade_destino == "Quilopascal"
            pressao_em_unidade_origem * MPa_to_kPa
        elseif unidade_destino == "Pascal"
            pressao_em_unidade_origem * MPa_to_Pa
        elseif unidade_destino == "PSI"
            pressao_em_unidade_origem * MPa_to_PSI
        elseif unidade_destino == "KSI"
            pressao_em_unidade_origem * MPa_to_KSI
        else
            return "Unidade de pressão de destino não suportada"
        end

    return resultado
end