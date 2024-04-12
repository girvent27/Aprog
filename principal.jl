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

            if pages[2] > 0 && pages[3] > 0
                conversion_menu(pages, index, options, "float", true, "angulo")
            end
        end

        if pages[1] == 2
            options = [
                "quilômetro quadrado",
                "hectare",
                "are",
                "metro quadrado",
                "decímetro quadrado",
                "centímetro quadrado",
                "milímetro quadrado",
                "polegada quadrada",
                "pé quadrado",
                "jarda quadrada",
                "rod quadrado",
                "rood",
                "acre",
                "homestead",
                "milha quadrada",
                "légua quadrada"
            ]
            menu("Conversão de Area", options)

            (pages, index) = read_page(pages, index, options)
            if pages[2] > 0 && pages[3] > 0
                conversion_menu(pages, index, options, "float", true, "area")
            end
        end
        if pages[1] == 3
            options = ["quilômetro", "hectômetro", "decâmetro", "metro", "decímetro", "centímetro", "milímetro", "polegada", "pé", "jarda", "rod", "furlong", "corrente", "mil", "milha", "légua"]

            menu("Conversão de Comprimento", options)

            (pages, index) = read_page(pages, index, options)
            if pages[2] > 0 && pages[3] > 0
                conversion_menu(pages, index, options, "float", true, "comprimento")
            end
        end
    end
    
    clear()
    return print("\n
================================================
Agradecemos por usar nosso serviço de conversão. \n
              <Jean/> & <Brunno/>
================================================")
end

