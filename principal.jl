function main()
    pages = [1, 0, 0]

    while pages[1] != 0 
        menu("+  Conversor de Medidas, Unidades e Moedas  +", pages)
        print("Digite uma opção:")
        pages[1] = parse(Int, readline())
        clear()

    end
end



function menu(title::String , options)
    println("==== $title ====")
    println("Opcões:")
    #foreach(x -> println(x), options)
    for i in 1:length(options)
        print("$i - ")
        println(options[i])
    end
end


function clear()
    Base.run(`dir`)
end


 