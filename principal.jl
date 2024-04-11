include("menu.jl")
include("contas.jl")

function main()
    pages = [0, 0, 0]
    index = 1

    while pages[1] >= 0 
        if pages[1] == 0
            options = ["Angulo", "Area", "Comprimento", "Forca", "Massa", "Moeda","Pressão", "Temperatura","Velocidade", "Volume"]
            menu("Conversor de Medidas, Unidades e Moedas", options)
            println("$pages e $index")

            (pages, index) = read_page(pages, index, options)
        end

        if pages[1] == 1
            options = ["Radiano -> Grau", "Grau -> Radiano", "Imprimir Tabela Radiano -> Grau", "Imprimir Tabela Radiano -> Grau"]
            menu("Conversão de Angulos", options)
            println("$pages e $index")

            (pages, index) = read_page(pages, index, options)
        end

        if pages[1] == 2
            options = ["Decimetro Quadrado (dm²)", "Milimetro Quadrado (mm²)", "Centimetro Quadrado(cm²)", "Metro Quadrado(m²)", "Kilometro Quadrado(Km²)", "Polegada Quadrada", "Pé Quadrado"]
            menu("Conversão de Area", options)
            println("$pages e $index")

            (pages, index) = read_page(pages, index, options)
        end
    end

    return "Fim do Programa"
end

