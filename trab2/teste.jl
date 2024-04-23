# Definição da estrutura Estudante
struct Estudante
    nome::String
    matricula::String
    notas_provas::Vector{Int}
    notas_trabalhos::Vector{Int}
    faltas::Int
    nota_final::Int
    situacao::Char
end

# Função para ler a turma de um arquivo
function ler_turma_arquivo(nome_arquivo::String)
    turma = Estudante[]
    try
        open(nome_arquivo, "r") do f
            for linha in eachline(f)
                campos = split(linha)
                nome = campos[1]
                matricula = campos[2]
                notas_provas = parse.(Int, campos[3:5])
                notas_trabalhos = parse.(Int, campos[6:7])
                faltas = parse(Int, campos[8])
                nota_final = parse(Int, campos[9])
                situacao = campos[10][1]
                push!(turma, Estudante(nome, matricula, notas_provas, notas_trabalhos, faltas, nota_final, situacao))
            end
        end
        println("Arquivo $nome_arquivo lido com sucesso!")
    catch
        println("Erro ao ler o arquivo!")
    end
    return turma
end

# Função para imprimir a turma de estudantes
function imprimir_turma(turma)
    if turma !== nothing
        println("Estudantes")
        println("--------------------------------------------------------------")
        println("Nome\t\tMatrícula\tN1\tN2\tN3\tT1\tT2\tFaltas\tFinal\tSit")
        println("--------------------------------------------------------------")
        for estudante in turma
            println("$(estudante.nome)\t\t$(estudante.matricula)\t$(join(string.(estudante.notas_provas), "\t"))\t$(join(string.(estudante.notas_trabalhos), "\t"))\t$(estudante.faltas)\t$(estudante.nota_final)\t$(estudante.situacao)")
        end
        println("--------------------------------------------------------------")
    else
        println("Não há turma carregada!")
    end
end

# Função para imprimir estatísticas da turma
function estatisticas_turma(turma)
    if turma !== nothing
        println("Estatísticas")
        println("-----------------------------------------------------------")
        println("N1\tN2\tN3\tT1\tT2\tFinal")
        println("-----------------------------------------------------------")
        println("Maiores notas da turma:\t\t$(maximum(vcat([estudante.notas_provas; estudante.notas_trabalhos] for estudante in turma)))")
        println("Menores notas da turma:\t\t$(minimum(vcat([estudante.notas_provas; estudante.notas_trabalhos] for estudante in turma)))")
        println("Notas médias da turma:\t\t$(mean(vcat([estudante.notas_provas; estudante.notas_trabalhos] for estudante in turma)))")
        println("Notas medianas da turma:\t\t$(median(vcat([estudante.notas_provas; estudante.notas_trabalhos] for estudante in turma)))")
        println("-----------------------------------------------------------")
        aprovados = count(estudante -> estudante.situacao == 'A', turma)
        reprovados = count(estudante -> estudante.situacao == 'R', turma)
        reprovados_faltas = count(estudante -> estudante.situacao == 'F', turma)
        total_estudantes = length(turma)
        println("Número de estudantes aprovados:\t\t $aprovados ($(aprovados/total_estudantes*100) %)")
        println("Número de estudantes reprovados:\t\t $reprovados ($(reprovados/total_estudantes*100) %)")
        println("Número de estudantes reprovados por faltas:\t\t $reprovados_faltas ($(reprovados_faltas/total_estudantes*100) %)")
        println("Histograma de notas finais em grupos de 10 pontos:")
        for i in 0:10:100
            count_notas = count(estudante -> estudante.nota_final in i:i+9, turma)
            println("$i - $(i+9)\t$count_notas")
        end
        println("-----------------------------------------------------------")
    else
        println("Não há turma carregada!")
    end
end

# Função para cadastrar um novo estudante
function cadastrar_estudante(turma)
    if turma !== nothing
        println("=========================================Cadastrar Novo Estudante=========================================")
        println("Digite o nome:")
        nome = readline()
        println("Digite a matrícula:")
        matricula = readline()
        println("Digite as três notas das provas:")
        notas_provas = [parse(Int, readline()) for _ in 1:3]
        println("Digite as duas notas dos trabalhos:")
        notas_trabalhos = [parse(Int, readline()) for _ in 1:2]
        println("Digite o número de faltas:")
        faltas = parse(Int, readline())
        nota_final = sum(notas_provas) + sum(notas_trabalhos)
        situacao = calcular_situacao(nota_final, faltas)
        novo_estudante = Estudante(nome, matricula, notas_provas, notas_trabalhos, faltas, nota_final, situacao)
        push!(turma, novo_estudante)
        println("Estudante cadastrado com sucesso!")
    else
        println("Não há turma carregada!")
    end
end

# Função para calcular a situação do estudante
function calcular_situacao(nota_final, faltas)
    if nota_final >= 60 && faltas <= 18
        return 'A'
    elseif faltas > 18
        return 'F'
    else
        return 'R'
    end
end

# Função para editar informações de um estudante
function editar_informacoes_estudante(turma)
    if turma !== nothing
        println("=========================================Editar Informações do Estudante=========================================")
        println("Opções:")
        println("1 - Selecionar por número de matrícula")
        println("2 - Selecionar por nome")
        println("3 - Voltar ao menu principal")
        println("Digite uma opção:")
        opcao = readline()
        if opcao == "1"
            println("Digite o número de matrícula:")
            matricula = readline()
            estudante = findfirst(est -> est.matricula == matricula, turma)
            if estudante !== nothing
                editar_estudante(turma, estudante)
            else
                println("Número de matrícula inválido!")
            end
        elseif opcao == "2"
            println("Digite o nome:")
            nome = readline()
            estudante = findfirst(est -> est.nome == nome, turma)
            if estudante !== nothing
                editar_estudante(turma, estudante)
            else
                println("Nome inválido!")
            end
        elseif opcao == "3"
            println("Retornando ao menu principal...")
        else
            println("Opção inválida!")
        end
    else
        println("Não há turma carregada!")
    end
end

# Função auxiliar para editar informações de um estudante
function editar_estudante(turma, estudante)
    println("Opções de edição:")
    println("1 - Alterar nome")
    println("2 - Alterar matrícula")
    println("3 - Alterar nota da prova 1")
    println("4 - Alterar nota da prova 2")
    println("5 - Alterar nota da prova 3")
    println("6 - Alterar nota do trabalho 1")
    println("7 - Alterar nota do trabalho 2")
    println("8 - Alterar número de faltas")
    println("9 - Voltar ao menu anterior")
    println("Digite uma opção:")
    opcao = readline()
    if opcao == "1"
        println("Digite o novo nome:")
        novo_nome = readline()
        estudante.nome = novo_nome
        println("Nome alterado com sucesso!")
    elseif opcao == "2"
        println("Digite a nova matrícula:")
        nova_matricula = readline()
        estudante.matricula = nova_matricula
        println("Matrícula alterada com sucesso!")
    elseif opcao in ["3", "4", "5"]
        indice = parse(Int, opcao) - 2
        println("Digite a nova nota da prova $indice:")
        nova_nota = parse(Int, readline())
        estudante.notas_provas[indice] = nova_nota
        println("Nota da prova $indice alterada com sucesso!")
    elseif opcao in ["6", "7"]
        indice = parse(Int, opcao) - 5
        println("Digite a nova nota do trabalho $indice:")
        nova_nota = parse(Int, readline())
        estudante.notas_trabalhos[indice] = nova_nota
        println("Nota do trabalho $indice alterada com sucesso!")
    elseif opcao == "8"
        println("Digite o novo número de faltas:")
        novas_faltas = parse(Int, readline())
        estudante.faltas = novas_faltas
        println("Número de faltas alterado com sucesso!")
    elseif opcao == "9"
        println("Retornando ao menu anterior...")
    else
        println("Opção inválida!")
    end
end

# Função para ler a turma do arquivo
function ler_turma_arquivo(nome_arquivo)
    try
        turma = Estudante[]
        open(nome_arquivo, "r") do file
            for line in eachline(file)
                split_line = split(line)
                nome = split_line[1]
                matricula = split_line[2]
                notas_provas = parse.(Int, split_line[3:5])
                notas_trabalhos = parse.(Int, split_line[6:7])
                faltas = parse(Int, split_line[8])
                nota_final = parse(Int, split_line[9])
                situacao = split_line[10][1]
                push!(turma, Estudante(nome, matricula, notas_provas, notas_trabalhos, faltas, nota_final, situacao))
            end
        end
        println("Arquivo $nome_arquivo lido com sucesso!")
        return turma
    catch
        println("Erro ao ler o arquivo!")
        return nothing
    end
end

# Função para escrever a turma no arquivo
function escrever_turma_arquivo(nome_arquivo, turma)
    try
        open(nome_arquivo, "a") do file
            for estudante in turma
                notas_provas_str = join(estudante.notas_provas, " ")
                notas_trabalhos_str = join(estudante.notas_trabalhos, " ")
                println(file, "$(estudante.nome)\t$(estudante.matricula)\t$notas_provas_str\t$notas_trabalhos_str\t$(estudante.faltas)\t$(estudante.nota_final)\t$(estudante.situacao)")
            end
        end
        println("Turma salva em $nome_arquivo com sucesso!")
    catch
        println("Erro ao salvar a turma no arquivo!")
    end
end

# Função principal
function main()
    turma = nothing
    nome_arquivo = ""
    while true
        println("=========================================Menu Principal=========================================")
        println("Opções:")
        println("1 - Ler turma de estudantes do arquivo")
        println("2 - Imprimir turma de estudantes")
        println("3 - Imprimir estatísticas da turma")
        println("4 - Cadastrar novo estudante")
        println("5 - Editar informações de um estudante")
        println("6 - Reler turma de estudantes do arquivo")
        println("7 - Salvar e Sair")
        println("Digite uma opção:")
        opcao = readline()
        if opcao == "1"
            println("=========================================Ler Turma=========================================")
            println("Opções:")
            println("1 - Ler turma existente")
            println("2 - Criar nova turma")
            println("3 - Voltar ao menu principal")
            println("Digite uma opção:")
            opcao = readline()
            if opcao == "1"
                println("Digite o nome do arquivo com a turma:")
                nome_arquivo = readline()
                turma = ler_turma_arquivo(nome_arquivo)
            elseif opcao == "2"
                println("Digite o nome do arquivo para a nova turma:")
                nome_arquivo = readline()
                try
                    if isfile(nome_arquivo)
                        println("Já existe um arquivo com esse nome. Deseja sobrescrevê-lo? (s/n)")
                        resposta = readline()
                        if resposta == "s"
                            println("Sobrescrevendo o arquivo...")
                            # Abre o arquivo em modo de escrita, sobrescrevendo o conteúdo anterior, se houver
                            open(nome_arquivo, "w") do file
                                println(file, "") # Cria um arquivo vazio
                            end
                            println("Arquivo $nome_arquivo criado com sucesso!")

                        else
                            println("Operação cancelada.")
                            return 
                        end
                    else
                        open(nome_arquivo, "w") do file
                            println(file, "") # Cria um arquivo vazio
                        end
                        println("Arquivo $nome_arquivo criado com sucesso!")
                        turma = Estudante[]
                    end
                catch
                    println("Erro ao criar o arquivo!")
                end
            elseif opcao == "3"
                println("Retornando ao menu principal...")
            else
                println("Opção inválida!")
            end
        elseif opcao == "2"
            imprimir_turma(turma)
        elseif opcao == "3"
            estatisticas_turma(turma)
        elseif opcao == "4"
            cadastrar_estudante(turma)
            if turma !== nothing
                escrever_turma_arquivo(nome_arquivo, turma)
            else
                println("Não há turma carregada!")
            end
        elseif opcao == "5"
            editar_informacoes_estudante(turma)
            if turma !== nothing
                escrever_turma_arquivo(nome_arquivo, turma)
            else
                println("Não há turma carregada!")
            end
        elseif opcao == "6"
            if turma !== nothing
                turma = ler_turma_arquivo(nome_arquivo)
            else
                println("Não há turma carregada!")
            end
        elseif opcao == "7"
            if turma !== nothing
                escrever_turma_arquivo(nome_arquivo, turma)
            else
                println("Não há turma carregada!")
            end
            println("Salvando e saindo...")
            break
        else
            println("Opção inválida!")
        end
    end
end

