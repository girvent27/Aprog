function menu(title::String , options)
    println("============================================================= $title =============================================================")
    println("Opcões:")
    #foreach(x -> println(x), options)
    for i in options
        print("$i - ")
        println(options[i])
    end
    print("Digite uma opcão:")
    parse(Int, readline())

    return "oi"
end

 