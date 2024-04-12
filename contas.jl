include("contas/angulo.jl")
include("contas/area_e_comprimento.jl")

function conta(number, conta, unidade_origem, unidade_destino)
    
    if conta == "area"
        converter_area(number, unidade_origem, unidade_destino)
    end
    if conta == "comprimento"
        converter_comprimento(numero, unidade_origem, unidade_destino)
    end
end