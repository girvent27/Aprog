#include("contas.jl")

function menu(title::String , options, pages) #Menu generico que recebe o titulo e imprime as opções listadas
    clear()
    println("\n ==========================\n|          $title          \n =================================")
    if pages[2] > 0
        println("Converter $(options[pages[2]]) para:")
    else
        println("Escolha uma das Opcões:")
    end
    
    for i in 1:length(options)
        print("\n  $i - ")
        print(options[i])
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
    if index == 3
        while pages[2] == pages[3]
            # Validação do numero digitado não ultrapassar o limite ou tipo
            print("Erro...\nDigite uma opção Válida: ")
            page_index = parse(Int, readline())
        end
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
function read_simple(limite)
    print("\nDigite uma opção: ")
    page_index = parse(Int, readline())
    while page_index > limite || page_index < 0
        # Validação do numero digitado não ultrapassar o limite ou tipo
        print("Erro...\nDigite uma opção Válida: ")
        page_index = parse(Int, readline())
    end
    return page_index
end
##########################################################################################################################
function conversion_menu(pages, index, options, number_type, negative_number::Bool, conta_a_fazer, init_options)
    repeat = false
    clear()
    title = init_options[pages[1]]
    println("==== Conversor de $title ====\n")
    print("Digite o(a) valor da conversão de $(options[pages[2]]) para $(options[pages[3]]): ")
    number = read_conversion(number_type, negative_number)
    unidade_origem = options[pages[2]]
    unidade_destino = options[pages[3]]
    result = conta(number, conta_a_fazer, unidade_origem, unidade_destino)

    println("O valor de $number $(options[pages[2]]) para $(options[pages[3]]) é de $result $(options[pages[3]])\n Opções: \n 1 - Repetir Conta\n 0 - Volta ao Menu Anterior")
    #return (pages, index) = read_page(pages, index, options)
    repeat_opt = read_simple(1)
    if repeat_opt == 1
        repeat = true
    end
    if repeat_opt == 0
        pages[2] = 0
        pages[3] = 0
        index = 2
        return pages, index
    end

    while repeat
        clear()
        println("==== Conversor de $title ====\n")
        print("Digite o(a) valor da conversão de $(options[pages[2]]) para $(options[pages[3]]): ")
        number = read_conversion(number_type, negative_number)
        unidade_origem = options[pages[2]]
        unidade_destino = options[pages[3]]
        result = conta(number, conta_a_fazer, unidade_origem, unidade_destino)

        println("O valor de $number $(options[pages[2]]) para $(options[pages[3]]) é de $result $(options[pages[3]])\n Opções: \n 1 - Repetir Conta\n 0 - Volta ao Menu Anterior")
        repeat_opt = read_simple(1)
        if repeat_opt == 1
            repeat = true
        end
        if repeat_opt == 0
            pages[2] = 0
            pages[3] = 0
            index = 2
            return pages, index
        end
    end
end
##############################################################################################################
function conversion_menu_angulo(pages, index, options, number_type, negative_number::Bool, conta_a_fazer, init_options)
    clear()
    title = init_options[pages[1]]
    println("==== Conversor de $title ====\n")
    print("Digite o(a) valor da conversão de $(options[pages[2]]): ")
    number = read_conversion(number_type, negative_number)
    unidade_origem = options[pages[2]]
    unidade_destino = ""
    result = conta(number, conta_a_fazer, unidade_origem, unidade_destino)

    println("O valor de $number em $(options[pages[2]]) é de $result\n Opções: \n 1 - Repetir Conta\n 0 - Volta ao Menu Anterior")
    #return (pages, index) = read_page(pages, index, options)
    repeat_opt = read_simple(1)
    if repeat_opt == 1
        repeat = true
    end
    if repeat_opt == 0
        pages[2] = 0
        pages[3] = 0
        index = 2
        return pages, index
    end

    while repeat
        clear()
        println("==== Conversor de $title ====\n")
        print("Digite o(a) valor da conversão de $(options[pages[2]]): ")
        number = read_conversion(number_type, negative_number)

        unidade_origem = options[pages[2]]
        unidade_destino = ""
        result = conta(number, conta_a_fazer, unidade_origem, unidade_destino)

        println("O valor de $number em $(options[pages[2]]) é de $result\n Opções: \n 1 - Repetir Conta\n 0 - Volta ao Menu Anterior")
        #return (pages, index) = read_page(pages, index, options)
        repeat_opt = read_simple(1)
        if repeat_opt == 1
            repeat = true
        end
        if repeat_opt == 0
            pages[2] = 0
            pages[3] = 0
            index = 2
            return pages, index
        end
    end
end
##############################################################################################################

function conversion_menu_moeda(pages, index, options, number_type, negative_number::Bool, conta_a_fazer, init_options)
    clear()
    title = init_options[pages[1]]
    println("==== Conversor de $title ====\n")
    print("Digite o(a) valor da cotação de 1 $(options[pages[2]]) em $(options[pages[3]]): ")
    number_1 = read_conversion(number_type, negative_number)

    print("Digite a quantidade, real positivo, em $(options[pages[2]]) a ser convertido: ")
    number_2 = read_conversion(number_type, negative_number)
    result = number_1 * number_2

    println("O valor de $number_2 $(options[pages[2]]) é de $result $(options[pages[3]])\n Opções: \n 1 - Repetir Conta\n 0 - Volta ao Menu Anterior")
    repeat_opt = read_simple(1)
    if repeat_opt == 1
        repeat = true
    end
    if repeat_opt == 0
        pages[2] = 0
        pages[3] = 0
        index = 2
        return pages, index
    end

    while repeat
        clear()
        title = init_options[pages[1]]
        println("==== Conversor de $title ====\n")
        print("Valor da cotação de 1 $(options[pages[2]]) em $(options[pages[3]]): $number_1 \n")

        print("Digite a quantidade, real positivo, em $(options[pages[2]]) a ser convertido: ")
        number_2 = read_conversion(number_type, negative_number)
        result = number_1 * number_2

        println("O valor de $number_2 $(options[pages[2]]) é de $result $(options[pages[3]])\n Opções: \n 1 - Repetir Conta\n 0 - Volta ao Menu Anterior")
        repeat_opt = read_simple(1)
        if repeat_opt == 1
            repeat = true
        end
        if repeat_opt == 0
            pages[2] = 0
            pages[3] = 0
            index = 2
            return pages, index
        end
    end
end

function read_conversion(type, negative::Bool) #Lê um numero; pede o $type tipo de variavel (int / float) e se usara numeros negativos
    if type == "int" && negative == false #Para Inteiros Positivos
        number = parse(Int, readline())
        while number < 0 
            print("Número Inválido, \n Digite o valor da conversão: ")
            number = parse(Int, readline())
            return number

        end
    end
   if type == "int" && negative #Para Inteiros
    number = parse(Int, readline())
    return number
   end

    if type == "float" && !negative  #Para Decimais Positivos
        number = parse(Float64, readline())
        while number < 0 
            print("Número Inválido, \n Digite o valor da conversão: ")
            number = round(parse(Float64, readline()), digits = 2)
            return number

        end
    end
    if type == "float" && negative #Para Decimais
        number = round(parse(Float64, readline()), digits = 2)
        return number
    end
    
end

function clear() # Limpar terminal de comando para cada novo menu
    #Base.run(`clear`)
end