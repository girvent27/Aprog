include("contas/angulo.jl")
include("contas/area_e_comprimento.jl")
include("contas/forca.jl")
include("contas/massa.jl")



function conta(numero, conta, unidade_origem, unidade_destino)
    
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
end 