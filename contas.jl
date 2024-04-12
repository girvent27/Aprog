include("contas/angulo.jl")
include("contas/area_e_comprimento.jl")
include("contas/forca.jl")


function conta(numero, conta, unidade_origem, unidade_destino)
    
    if conta == "area"
        converter_area(numero, unidade_origem, unidade_destino)
    end
    if conta == "comprimento"
        converter_comprimento(numero, unidade_origem, unidade_destino)
    end
    if conta == "forca"
        converter_forca(numero, unidade_origem, unidade_destino)
    end
end