include("menus.jl")
include("fun.jl")

function main()
    pages = [0, 0, 0]
    index = 1
    init_options = [
        "Ler turma de estudantes do arquivo",
        "Imprimir turma de estudantes",
        "Imprimir estatísticas da turma",
        "Cadastrar novo estudante",
        "Editar informações de um estudante",
        "Reler turma de estudantes do arquivo",
        "Salvar e Sair"]
    while index > 3
        index = 3
    end

    while pages[1] >= 0 
        if pages[1] == 0
            menu("Menu Principal", init_options, pages)

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
            print("Deseja realmente sair e salver? (s/n): ")
            opted = readline()

            while opted[1] != "s" && opted[1] != "n"
                print("Deseja realmente sair e salver? (s/n): ")
                opted = readline()
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
