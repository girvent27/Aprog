include("menu.jl")
include("contas.jl")

function main()
    pages = [0, 0, 0]
    index = 1
    init_options = ["Angulo", "Area", "Comprimento", "Forca", "Massa", "Moeda","Pressão", "Temperatura","Velocidade", "Volume"]

    while index > 3
        index = 3
    end

    while pages[1] >= 0 
        if pages[1] == 0
            menu("Conversor de Medidas, Unidades e Moedas", init_options)

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
        if pages[1] == 4
            options = ["Newton", "Quilograma força", "Dina", "Libra-força"]

            menu("Conversão de Força", options)

            (pages, index) = read_page(pages, index, options)
            if pages[2] > 0 && pages[3] > 0
                conversion_menu(pages, index, options, "float", true, "forca")
            end
        end
        if pages[1] == 5
            options = ["quilograma", "hectograma", "decagrama", "grama", "decigrama", "centigrama", "miligrama", "Tonelada curta", "Quarto curto", "Quintal curto", "Arroba", "Libra avoirdupois", "Onça avoirdupois", "Dracma avoirdupois", "Grão"]

            menu("Conversão de Massa", options)

            (pages, index) = read_page(pages, index, options)
            if pages[2] > 0 && pages[3] > 0
                conversion_menu(pages, index, options, "float", false, "massa")
            end
        end
        if pages[1] == 6
            options = ["Dólar Americano (USD)", "Libra Esterlina (GBP)", "Euro (EUR)", "Iene Japonês (JPY)", "Franco Suíço (CHF)", "Dólar Australiano (AUD)", "Dólar Canadense (CAD)", "Real (BRL)", "Renminbi (RMB)"]

            menu("Conversão de Moedas", options)

            (pages, index) = read_page(pages, index, options)
            if pages[2] > 0 && pages[3] > 0
                conversion_menu_moeda(pages, index, options, "float", false, "moeda")
            end
        end
        if pages[1] == 7
            options = ["Megapascal", "Quilopascal", "PascalSistema", "KSI", "PSI", "Libra por polegada quadrada"]


            menu("Conversão de Pressão", options)

            (pages, index) = read_page(pages, index, options)
            if pages[2] > 0 && pages[3] > 0
                conversion_menu(pages, index, options, "float", false, "pressao")
            end
        end
        if pages[1] == 7
            options = ["Kelvin", "Grau Celsius", "Grau Fahrenheit", "Grau Rankine", "Grau Réaumur", "Grau Newton", "Grau Delisle"]
            menu("Conversão de Temperatura", options)

            (pages, index) = read_page(pages, index, options)
            if pages[2] > 0 && pages[3] > 0
                conversion_menu_moeda(pages, index, options, "float", false, "pressao")
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
#Consertar array primario sendo trocado pelo primario no titulo
