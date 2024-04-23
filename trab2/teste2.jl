struct Estudante
    nome::String
    matricula::String
    notas_provas::Vector{Int}
    notas_trabalhos::Vector{Int}
    faltas::Int
    nota_final::Int
    situacao::Char
end

function ler_turma(arquivo::String)
    estudantes = []
    if isfile(arquivo)
        open(arquivo, "r") do file
            for line in eachline(file)
                data = split(line)
                push!(estudantes, Estudante(data[1], data[2], parse.(Int, data[3:5]), parse.(Int, data[6:7]), parse(Int, data[8]), parse(Int, data[9]), data[10][1]))
            end
        end
        println("Arquivo $arquivo lido com sucesso!")
    else
        println("Arquivo $arquivo não existe!")
    end
    return estudantes
end

function imprimir_turma(estudantes)
    if isempty(estudantes)
        println("Não há turma carregada!")
        return
    end
    println("Estudantes")
    println("--------------------------------------------------------------")
    println("Nome                Matrícula    N1 N2 N3 T1 T2 Fal  Final Sit")
    println("--------------------------------------------------------------")
    for estudante in estudantes
        println(lpad(estudante.nome, 20), " ", lpad(estudante.matricula, 13), " ",
                lpad(join(estudante.notas_provas, " "), 11), " ", lpad(join(estudante.notas_trabalhos, " "), 5), " ",
                lpad(string(estudante.faltas), 4), " ", lpad(string(estudante.nota_final), 4), " ", estudante.situacao)
    end
    println("--------------------------------------------------------------")
end

function calcular_estatisticas(estudantes)
    if isempty(estudantes)
        println("Não há turma carregada!")
        return
    end
    notas_finais = [estudante.nota_final for estudante in estudantes]
    maior_notas = [maximum([estudante.notas_provas; estudante.notas_trabalhos]) for estudante in estudantes]
    menor_notas = [minimum([estudante.notas_provas; estudante.notas_trabalhos]) for estudante in estudantes]
    notas_medias = mean.([estudante.notas_provas; estudante.notas_trabalhos] for estudante in estudantes)
    notas_medianas = median.([estudante.notas_provas; estudante.notas_trabalhos] for estudante in estudantes)

    println("Estatísticas")
    println("-----------------------------------------------------------")
    println("N1    N2    N3    T1    T2  Final")
    println("-----------------------------------------------------------")
    println("Maiores notas da turma    ", join(maximum.(eachcol(hcat([estudante.notas_provas; estudante.notas_trabalhos] for estudante in estudantes)), dims=1), " "))
    println("Menores notas da turma    ", join(minimum.(eachcol(hcat([estudante.notas_provas; estudante.notas_trabalhos] for estudante in estudantes)), dims=1), " "))
    println("Notas médias da turma      ", join(notas_medias, " "))
    println("Notas medianas da turma    ", join(notas_medianas, " "))
    println("-----------------------------------------------------------")
    aprovados = count(estudante -> estudante.situacao == 'A', estudantes)
    reprovados = count(estudante -> estudante.situacao == 'R', estudantes)
    reprovados_faltas = count(estudante -> estudante.situacao == 'F', estudantes)
    total_estudantes = length(estudantes)
    println("Número de estudantes aprovados:             $aprovados ($(round(aprovados / total_estudantes * 100, digits=1))%)")
    println("Número de estudantes reprovados:            $reprovados ($(round(reprovados / total_estudantes * 100, digits=1))%)")
    println("Número de estudantes reprovados por falta:  $reprovados_faltas ($(round(reprovados_faltas / total_estudantes * 100, digits=1))%)")
    println("-----------------------------------------------------------")
    println("Histograma de notas finais em grupos de 10 pontos:")
    for i in 0:10:100
        count_notas = count(x -> x in i:i+9, notas_finais)
        println(rpad("$i - $(i+9)", 7), " ", " " ^ count_notas, count_notas > 0 ? "*^" : "")
    end
    println("-----------------------------------------------------------")
end

function cadastrar_estudante(estudantes)
    if isempty(estudantes)
        println("Não há turma carregada!")
        return
    end
    println("Cadastro de Novo Estudante")
    println("-----------------------------------------")
    println("Digite o nome: ")
    nome = readline()
    println("Digite a matrícula: ")
    matricula = readline()
    println("Digite as três notas das provas: ")
    notas_provas = [parse(Int, readline()) for _ in 1:3]
    println("Digite as duas notas dos trabalhos: ")
    notas_trabalhos = [parse(Int, readline()) for _ in 1:2]
    println("Digite o número de faltas: ")
    faltas = parse(Int, readline())
    nota_final = sum(notas_provas) + sum(notas_trabalhos)
    situacao = nota_final >= 60 && faltas <= 18 ? 'A' : faltas > 18 ? 'F' : 'R'
    push!(estudantes, Estudante(nome, matricula, notas_provas, notas_trabalhos, faltas, nota_final, situacao))
    println("Estudante cadastrado com sucesso!")
end

function editar_informacoes(estudantes)
    if isempty(estudantes)
        println("Não há turma carregada!")
        return
    end
    println("Editar Informações do Estudante")
    println("-----------------------------------------")
    println("Opções:")
    println("1 - Selecionar por número de matrícula")
    println("2 - Selecionar por nome")
    println("3 - Voltar ao menu principal")
    println("Digite uma opção:")
    opcao = parse(Int, readline())
    if opcao == 1
        println("Digite o número de matrícula: ")
        matricula = readline()
        index = findfirst(isequal(matricula), [estudante.matricula for estudante in estudantes])
        if index === nothing
            println("Número de matrícula inválido!")
            return
        end
    elseif opcao == 2
        println("Digite o nome: ")
        nome = readline()
        index = findfirst(isequal(nome), [estudante.nome for estudante in estudantes])
        if index === nothing
            println("Nome inválido!")
            return
        end
    elseif opcao == 3
        return
    else
        println("Opção inválida!")
        return
    end
    println("Opções:")
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
    opcao = parse(Int, readline())
    if opcao == 1
        println("Digite o novo nome: ")
        novo_nome = readline()
        estudantes[index].nome = novo_nome
    elseif opcao == 2
        println("Digite a nova matrícula: ")
        nova_matricula = readline()
        estudantes[index].matricula = nova_matricula
    elseif opcao in 3:5
        println("Digite a nova nota: ")
        nova_nota = parse(Int, readline())
        estudantes[index].notas_provas[opcao - 2] = nova_nota
    elseif opcao in 6:7
        println("Digite a nova nota: ")
        nova_nota = parse(Int, readline())
        estudantes[index].notas_trabalhos[opcao - 5] = nova_nota
    elseif opcao == 8
        println("Digite o novo número de faltas: ")
        novas_faltas = parse(Int, readline())
        estudantes[index].faltas = novas_faltas
    elseif opcao == 9
        return
    else
        println("Opção inválida!")
        return
    end
    nota_final = sum(estudantes[index].notas_provas) + sum(estudantes[index].notas_trabalhos)
    situacao = nota_final >= 60 && estudantes[index].faltas <= 18 ? 'A' : estudantes[index].faltas > 18 ? 'F' : 'R'
    estudantes[index].nota_final = nota_final
    estudantes[index].situacao = situacao
    println("Informações do estudante atualizadas com sucesso!")
end

function salvar_e_sair(estudantes, arquivo)
    if isempty(estudantes)
        println("Não há turma carregada!")
        return
    end
    if isfile(arquivo)
        println("Arquivo $arquivo já existe. Deseja sobrescrevê-lo? (S/N)")
        resposta = uppercase(chomp(readline()))
        if resposta != "S"
            println("Até a próxima!")
            return
        end
    end
    open(arquivo, "a") do file
        for estudante in estudantes
            println(file, join([estudante.nome, estudante.matricula, join(string.(estudante.notas_provas), " "),
                                join(string.(estudante.notas_trabalhos), " "), string(estudante.faltas), string(estudante.nota_final),
                                string(estudante.situacao)], " "))
        end
    end
    println("Turma salva com sucesso no arquivo $arquivo. Até a próxima!")
end

function main2()
    estudantes = []
    arquivo = ""
    while true
        println("=========================================")
        println("Menu Principal")
        println("=========================================")
        println("Opções:")
        println("1 - Ler turma de estudantes do arquivo")
        println("2 - Imprimir turma de estudantes")
        println("3 - Imprimir estatísticas da turma")
        println("4 - Cadastrar novo estudante")
        println("5 - Editar informações de um estudante")
        println("6 - Reler turma de estudantes do arquivo")
        println("7 - Salvar e Sair")
        println("Digite uma opção:")
        opcao = parse(Int, readline())
        if opcao == 1
            println("=========================================")
            println("Ler Turma")
            println("=========================================")
            println("Opções:")
            println("1 - Ler turma existente")
            println("2 - Criar nova turma")
            println("3 - Voltar ao menu principal")
            println("Digite uma opção:")
            sub_opcao = parse(Int, readline())
            if sub_opcao == 1
                println("Digite o nome do arquivo com a turma: ")
                arquivo = readline()
                estudantes = ler_turma(arquivo)
            elseif sub_opcao == 2
                println("Digite o nome do arquivo para a nova turma: ")
                novo_arquivo = readline()
                if isfile(novo_arquivo)
                    println("Arquivo $novo_arquivo já existe. Deseja sobrescrevê-lo? (S/N)")
                    resposta = uppercase(chomp(readline()))
                    if resposta == "S"
                        estudantes = []
                        arquivo = novo_arquivo
                    end
                else
                    estudantes = []
                    arquivo = novo_arquivo
                    println("Arquivo $novo_arquivo criado com sucesso!")
                end
            elseif sub_opcao == 3
                continue
            else
                println("Opção inválida!")
            end
        elseif opcao == 2
            imprimir_turma(estudantes)
        elseif opcao == 3
            calcular_estatisticas(estudantes)
        elseif opcao == 4
            cadastrar_estudante(estudantes)
        elseif opcao == 5
            editar_informacoes(estudantes)
        elseif opcao == 6
            if arquivo != ""
                estudantes = ler_turma(arquivo)
            else
                println("Não há arquivo carregado!")
            end
        elseif opcao == 7
            salvar_e_sair(estudantes, arquivo)
            break
        else
            println("Opção inválida!")
        end
    end
end