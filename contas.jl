include("contas/area_e_comprimento.jl")
include("contas/forca.jl")
include("contas/massa.jl")
include("contas/pressao.jl")
include("contas/temperatura.jl")
include("contas/velocidade.jl")
include("contas/volumes.jl")

function conta(numero, conta, unidade_origem, unidade_destino)

    if conta == "Grau -> Radiano"
        # Função para converter graus para radianos
            result = (numero * 3.14) / 180
            return result
        
    end
    if conta == "Radiano -> Grau"
        # Função para converter radianos para graus
            result = (numero * 180) / 3.14
            return result
    end
    if conta == "area"
        return converter_area(numero, unidade_origem, unidade_destino)
    end
    if conta == "comprimento"
        return converter_comprimento(numero, unidade_origem, unidade_destino)
    end
    if conta == "forca"
        return converter_forca(numero, unidade_origem, unidade_destino)
    end
    if conta == "massa"
        return converter_massa(numero, unidade_origem, unidade_destino)
    end
    if conta == "pressao"
        return converter_pressao(numero, unidade_origem, unidade_destino)
    end
    if conta == "temperatura"
        return converter_temperatura(numero, unidade_origem, unidade_destino)
    end
    if conta == "velocidade"
        return converter_velocidade(numero, unidade_origem, unidade_destino)
    end
    if conta == "volume"
        return converter_volume(numero, unidade_origem, unidade_destino)
    end
end 


