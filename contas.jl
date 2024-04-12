include("contas/area_e_comprimento.jl")
include("contas/forca.jl")
include("contas/massa.jl")
include("contas/pressao.jl")
include("contas/temperatura.jl")
include("contas/velocidade.jl")
include("contas/volumes.jl")

function conta(numero, conta, unidade_origem, unidade_destino)

    if conta = "angulo_grau_rad"
        # Função para converter graus para radianos
        function graus_para_radianos(numero)
            return numero * π / 180
        end
    end
    if conta = "angulo_rad_grau"
        # Função para converter radianos para graus
        function radianos_para_graus(numero)
            return numero * 180 / π
        end
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
end 


