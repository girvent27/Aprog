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
            menu("Conversor de Medidas, Unidades e Moedas", init_options, pages)

            (pages, index) = read_page(pages, index, init_options)
        end

        if pages[1] == 1
            options = ["Radiano -> Grau", "Grau -> Radiano"]
            menu("Conversão de Angulos", options, pages)
            read_page(pages, index, options)
            (pages, index) = conversion_menu_angulo(pages, index, options, "float", true, options[pages[2]], init_options)
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
            menu("Conversão de Area", options, pages)

            (pages, index) = read_page(pages, index, options)
            if pages[2] > 0 && pages[3] > 0
                (pages, index) = conversion_menu(pages, index, options, "float", true, "area", init_options)
            end
        end
        if pages[1] == 3
            options = ["quilômetro", "hectômetro", "decâmetro", "metro", "decímetro", "centímetro", "milímetro", "polegada", "pé", "jarda", "rod", "furlong", "corrente", "mil", "milha", "légua"]

            menu("Conversão de Comprimento", options, pages)

            (pages, index) = read_page(pages, index, options)
            if pages[2] > 0 && pages[3] > 0
                (pages, index) = conversion_menu(pages, index, options, "float", true, "comprimento", init_options)
            end
        end
        if pages[1] == 4
            options = ["Newton", "Quilograma força", "Dina", "Libra-força"]

            menu("Conversão de Força", options, pages)

            (pages, index) = read_page(pages, index, options)
            if pages[2] > 0 && pages[3] > 0
                (pages, index) = conversion_menu(pages, index, options, "float", true, "forca", init_options)
            end
        end
        if pages[1] == 5
            options = ["quilograma", "hectograma", "decagrama", "grama", "decigrama", "centigrama", "miligrama", "Tonelada curta", "Quarto curto", "Quintal curto", "Arroba", "Libra avoirdupois", "Onça avoirdupois", "Dracma avoirdupois", "Grão"]

            menu("Conversão de Massa", options, pages)

            (pages, index) = read_page(pages, index, options)
            if pages[2] > 0 && pages[3] > 0
                (pages, index) = conversion_menu(pages, index, options, "float", true, "massa", init_options)
            end
        end
        if pages[1] == 6
            options = ["Dólar Americano (USD)", "Libra Esterlina (GBP)", "Euro (EUR)", "Iene Japonês (JPY)", "Franco Suíço (CHF)", "Dólar Australiano (AUD)", "Dólar Canadense (CAD)", "Real (BRL)", "Renminbi (RMB)"]

            menu("Conversão de Moedas", options, pages)

            (pages, index) = read_page(pages, index, options)
            if pages[2] > 0 && pages[3] > 0
                (pages, index) = conversion_menu_moeda(pages, index, options, "float", true, "moeda", init_options)
            end
        end
        if pages[1] == 7
            options = ["Megapascal", "Quilopascal", "PascalSistema", "KSI", "PSI"]
            menu("Conversão de Pressão", options, pages)

            (pages, index) = read_page(pages, index, options)
            if pages[2] > 0 && pages[3] > 0
                (pages, index) = conversion_menu(pages, index, options, "float", true, "pressao", init_options)
            end
        end
        if pages[1] == 8
            options = ["Kelvin", "Grau Celsius", "Grau Fahrenheit", "Grau Rankine", "Grau Réaumur", "Grau Newton", "Grau Delisle"]
            menu("Conversão de Temperatura", options, pages)

            (pages, index) = read_page(pages, index, options)
            if pages[2] > 0 && pages[3] > 0
                (pages, index) = conversion_menu(pages, index, options, "float", true, "temperatura", init_options)
            end
        end
        if pages[1] == 9
            options = ["Quilômetro por hora", "Metro por segundo", "Quilômetro por segundo", "Pé por segundo", "Milha por hora", "Milha por segundo"]
            menu("Conversão de Temperatura", options, pages)

            (pages, index) = read_page(pages, index, options)
            if pages[2] > 0 && pages[3] > 0
                (pages, index) = conversion_menu(pages, index, options, "float", true, "velocidade", init_options)
            end
        end
        if pages[1] == 10
            options = ["Sólido", "Líquido"]
            menu("Conversão de Volume", options, pages)
            selected = parse(Int, readline())

            if selected == 1
                options = ["Quilômetro cúbico ", "Hectômetro cúbico ", "Decâmetro cúbico ", "Metro cúbico ", "Decímetro cúbico", "Polegada cúbica ", "Pé cúbico ", "Jarda cúbica ", "Acre-pé", "Milha cúbica "]
                menu("Conversão de Volume", options, pages)

                (pages, index) = read_page(pages, index, options)
                if pages[2] > 0 && pages[3] > 0
                    (pages, index) = conversion_menu(pages, index, options, "float", true, "volume", init_options)
                end
            end
            if selected == 2
                options = ["Quilolitro", "Hectolitro", "Decalitro", "Litro", "Decilitro", "barril", "galão", "quarto", "pinto", "gill", "onça líquida ou fluida", "dracma líquido ou fluido", "minim"]
                menu("Conversão de Volume", options, pages)

                (pages, index) = read_page(pages, index, options)
                if pages[2] > 0 && pages[3] > 0
                    (pages, index) = conversion_menu(pages, index, options, "float", true, "volume", init_options)
                end
            end
            if selected == 0
                    pages[index] = 0 #Zera o número do array na index atual
                    index = index - 1 #Mudando a index para a anterior para mudar o menu atual para o anterior
                    pages[index] = 0 #Zera o número do array na index anterior
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
#fazer volume solido e liq
