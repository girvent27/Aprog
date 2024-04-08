function read_page(pages, index::Int) #Lê a pagina que o usuário deseja ir e muda no Array 'pages[]'
    print("\nDigite uma opção: ")
    page_index = parse(Int, readline())

        while page_index > length(pages) || page_index < 0
            print("Erro...\nDigite uma opção Válida: ")
            page_index = parse(Int, readline())
        end
        if page_index == 0 && pages[1] == 0 #se estiver no menu inicial e digitar '0', acaba o programa
            return pages[1] = -1
 
         else #Senão, incrementa à index seguinte do array para escolher a opção da pagina atual/seguinte
            pages[index] = page_index
            index = index + 1
            if pages[index] == 0
                pages[index] = page_index
                return pages 
            
             elseif page_index == 0 #Mas, se o número digitado for 0, volta ao menu anterior
                    index = index - 1
                    pages[index] = 0
             end
         end
end

function menu(title::String , options) #Menu generico que recebe o titulo e imprime as opções listadas
    println("==== $title ====\n")
    println("Opcões:")
    #foreach(x -> println(x), options)
    for i in 1:length(options)
        print("$i - ")
        println(options[i])
        
    end
    if title == "Conversor de Medidas, Unidades e Moedas"
        println("0 - Sair")
    else
        println("0 - Voltar")
    end
end


function clear()
    Base.run(`dir`)
end

function main()
    pages = [0, 0, 0]
    index = 1

    while pages[1] >= 0 
        if pages[1] == 0
            println(pages)
            options = ["Angulo", "Area", "Comprimento", "Forca", "Massa", "Moeda","Pressão", "Temperatura","Velocidade", "Volume"]
            menu("Conversor de Medidas, Unidades e Moedas", options)
            read_page(pages, index)
        end

        if pages[1] == 1
            println(pages)
            options = ["Radiano -> Grau", "Grau -> Radiano", "Imprimir Tabela Radiano -> Grau", "Imprimir Tabela Radiano -> Grau"]
            menu("Angulos", options)
            read_page(pages, index)
        end
    end

    return "Fim do Programa"
end
 