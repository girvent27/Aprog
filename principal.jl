include("menu.jl")
include("contas.jl")

function main()
    pages = [0, 0, 0]
    index = 1

    while index > 3
        index = 3
    end

    while pages[1] >= 0 
        if pages[1] == 0
            options = ["Angulo", "Area", "Comprimento", "Forca", "Massa", "Moeda","Pressão", "Temperatura","Velocidade", "Volume"]
            menu("Conversor de Medidas, Unidades e Moedas", options)

            (pages, index) = read_page(pages, index, options)
        end

        if pages[1] == 1
            options = ["Radiano -> Grau", "Grau -> Radiano", "Imprimir Tabela Radiano -> Grau", "Imprimir Tabela Radiano -> Grau"]
            menu("Conversão de Angulos", options)

            (pages, index) = read_page(pages, index, options)

            if pages[3] > 0
                conversion_menu(pages, index, options, float, true)
            end
        end

        if pages[1] == 2
            options = ["Decimetro Quadrado (dm²)", "Milimetro Quadrado (mm²)", "Centimetro Quadrado(cm²)", "Metro Quadrado(m²)", "Kilometro Quadrado(Km²)", "Polegada Quadrada", "Pé Quadrado"]
            menu("Conversão de Area", options)

            (pages, index) = read_page(pages, index, options)
        end
    end
                  
    return print("\n================================================
Agradecemos por usar nosso serviço de conversão. \n
              <Jean/> & <Brunno/>
================================================")
end


