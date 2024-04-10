function read_page(pages, index::Int) #Lê a pagina que o usuário deseja ir e muda no Array 'pages[]'
    print("\nDigite uma opção: ")
    page_index = parse(Int, readline())
        while index > 3            
            index = 3
        end

        while page_index > length(pages) || page_index < 0
            # Validação do numero digitado não ultrapassar o limite ou tipo
            print("Erro...\nDigite uma opção Válida: ")
            page_index = parse(Int, readline())
        end
        if page_index == 0 && pages[1] == 0 #se estiver no menu inicial e digitar '0', acaba o programa
            return pages[1] = -1
 
         else #Senão, segue a funcionalidade básica de mudança de menu.  
            if page_index == 0 #Se o número digitado for 0, volta ao menu anterior
                index = index - 1 #Mudando a Index para a anterior para mudar o menu atual para o anterior
                pages[index] = 0
                return pages, index
                
            else #Senão, incrementa à index seguinte do array para escolher a opção da pagina atual/seguinte
                pages[index] = page_index 
                index = index + 1 #Mudando a Index para a anterior para mudar o menu atual para o anterior
                return pages, index 
            end
         end
end

function menu(title::String , options, ) #Menu generico que recebe o titulo e imprime as opções listadas
    clear()
    println("==== $title ====\n")
    println("Opcões:")
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


function clear() # Limpar terminal de comando para cada novo menu
    Base.run(`clear`)
end

function main()
    pages = [0, 0, 0]
    index = 1

    while pages[1] >= 0 
        if pages[1] == 0
            println("$pages e $index")
            options = ["Angulo", "Area", "Comprimento", "Forca", "Massa", "Moeda","Pressão", "Temperatura","Velocidade", "Volume"]
            menu("Conversor de Medidas, Unidades e Moedas", options)
            (pages, index) = read_page(pages, index)
        end

        if pages[1] == 1
            println("$pages e $index")
            options = ["Radiano -> Grau", "Grau -> Radiano", "Imprimir Tabela Radiano -> Grau", "Imprimir Tabela Radiano -> Grau"]
            menu("Conversão de Angulos", options)
            (pages, index) = read_page(pages, index)
        end

        if pages[1] == 2
            println("$pages e $index")
            options = ["Decimetro Quadrado (dm²)", "Milimetro Quadrado (mm²)", "Centimetro Quadrado(cm²)", "Metro Quadrado(m²)", "Kilometro Quadrado(Km²)"]
            menu("Conversão de Area", options)
            (pages, index) = read_page(pages, index)
        end
    end

    return "Fim do Programa"
end
