include("contas.jl")

function menu(title::String , options) #Menu generico que recebe o titulo e imprime as opções listadas
    clear()
    println("\n ==========================\n|          $title          \n =================================")
    println("Opcões:")
    for i in 1:length(options)
        print("\n  $i - ")
        print(options[i])
    end
    if title == "Conversor de Medidas, Unidades e Moedas"
        println("\n------------------\n 0 - Sair")
    else
        println("\n-------------------\n 0 - Voltar")
    end    
end

#=======================================================================================================================#

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
    if page_index == 0 && pages[1] == 0 #se estiver no menu inicial e digitar '0', acaba o programa com uma mensagem
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

#=======================================================================================================================#

function conversion_menu(pages, index, options, number_type, negative_number::Bool, conta_a_fazer)
    clear()
    title = options[pages[1]]
    println("==== Conversor de $title ====\n")
    print("Digite o(a) valor da conversão de $(options[pages[2]]) para $(options[pages[3]]): ")
    number = read_conversion(number_type, negative_number)
    unidade_origem = options[pages[2]]
    unidade_destino = options[pages[3]]
    result = conta(number, conta_a_fazer, unidade_origem, unidade_destino)

    println("O valor de $number $(options[pages[2]]) para $(options[pages[3]]) é de $result $(options[pages[3]])\n Opções: \n 1 - Repetir Conta\n 0 - Volta ao Menu Anterior")
    return (pages, index) = read_page(pages, index, options)

end

function read_conversion(type, negative::Bool) #Lê um numero; pede o $type tipo de variavel (int / float) e se usara numeros negativos
    if type == "int" && negative == false #Para Inteiros Positivos
        number = parse(Int, readline())
        while number < 0 
            print("Número Inválido, \n Digite o valor da conversão: ")
            number = parse(Int, readline())
        end
    end
   if type == "int" && negative #Para Inteiros
    number = parse(Int, readline())
   end

    if type == "float" && negative == false #Para Decimais Positivos
        number = parse(Float64, readline())
        while number < 0 
            print("Número Inválido, \n Digite o valor da conversão: ")
            number = parse(Int, readline())
        end
    end
    if type == "float" && negative #Para Decimais
        number = parse(Float64, readline())
    end
    
end

function clear() # Limpar terminal de comando para cada novo menu
#    Base.run(`cls`)
end