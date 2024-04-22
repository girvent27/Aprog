function converter_temperatura(numero, unidade_origem, unidade_destino)
    # Realizando a conversão
    temperatura_em_unidade_origem = 
        if unidade_origem == "Kelvin"
            numero
        elseif unidade_origem == "Grau Celsius"
            numero + 273.15
        elseif unidade_origem == "Grau Fahrenheit"
            (numero + 459.67) * 5 / 9
        elseif unidade_origem == "Grau Rankine"
            numero * 5 / 9
        elseif unidade_origem == "Grau Réaumur"
            numero * 5 / 4 + 273.15
        elseif unidade_origem == "Grau Newton"
            numero * 100 / 33 + 273.15
        elseif unidade_origem == "Grau Delisle"
            373.15 - numero * 2 / 3
        else
            return "Unidade de temperatura de origem não suportada"
        end

    # Convertendo para a unidade de destino
    resultado = 
        if unidade_destino == "Kelvin"
            temperatura_em_unidade_origem
        elseif unidade_destino == "Grau Celsius"
            temperatura_em_unidade_origem - 273.15
        elseif unidade_destino == "Grau Fahrenheit"
            temperatura_em_unidade_origem * 9 / 5 - 459.67
        elseif unidade_destino == "Grau Rankine"
            temperatura_em_unidade_origem * 9 / 5
        elseif unidade_destino == "Grau Réaumur"
            (temperatura_em_unidade_origem - 273.15) * 4 / 5
        elseif unidade_destino == "Grau Newton"
            (temperatura_em_unidade_origem - 273.15) * 33 / 100
        elseif unidade_destino == "Grau Delisle"
            (373.15 - temperatura_em_unidade_origem) * 3 / 2
        else
            return "Unidade de temperatura de destino não suportada"
        end

    return resultado
end