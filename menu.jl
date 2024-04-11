function read_page(pages, index::Int, options) #Lê a pagina que o usuário deseja ir e muda no Array 'pages[]'
    print("\nDigite uma opção: ")
    page_index = parse(Int, readline())

    while index < 1            
        index = index + 1
    end
    while page_index > length(options) || page_index < 0 || !isa(page_index, Number)
        # Validação do numero digitado não ultrapassar o limite ou tipo
        print("Erro...\nDigite uma opção Válida: ")
        page_index = parse(Int, readline())
    end
    if page_index == 0 && pages[1] == 0 #se estiver no menu inicial e digitar '0', acaba o programa
        pages[1] = pages[1] - 1
        return pages            

        else #Senão, segue a funcionalidade básica de mudança de menu.  
        if page_index == 0 #Se o número digitado for 0, volta ao menu anterior
            pages[index] = 0 #Zera o número do array na index atual
            index = index - 1 #Mudando a index para a anterior para mudar o menu atual para o anterior
            pages[index] = 0 #Zera o número do array na index anterior
            return pages, index

        else #Senão, incrementa à index seguinte do array para escolher a opção da pagina atual/seguinte
            pages[index] = page_index 
            if index == 3
                return pages, index 

            else
                index = index + 1 #Mudando a Index para a anterior para mudar o menu atual para o anterior

            end
            return pages, index 
            
        end
    end
end

function conversion_menu(pages)
    print("hello")

end

function menu(title::String , options) #Menu generico que recebe o titulo e imprime as opções listadas
    clear()
    println("==== $title ====\n")
    println("Opcões:")
    for i in 1:length(options)
        print("$i - ")
        println(options[i])
    end
    if title == "Conversor de Medidas, Unidades e Moedas"
        println("\n0 - Sair")
    else
        println("\n0 - Voltar")
    end    
end


function clear() # Limpar terminal de comando para cada novo menu
#    Base.run(`cls`)
end