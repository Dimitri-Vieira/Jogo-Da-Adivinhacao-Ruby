def da_boas_vindas
    puts
    puts "        P  /_\\  P                              "
    puts "       /_\\_|_|_/_\\                             "
    puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
    puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
    puts "  |' '  |  |_|  |'  ' |                        "
    puts "  |_____| ' _ ' |_____|                        " 
    puts "        \\__|_|__/                              "
    puts
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n\n\n\n\n\n\n"
    puts "Começaremos o jogo, #{nome}"
    return nome
end

def pede_dificuldade
    puts "Qual o nível de dificuldade?"
    puts "(1) Muito fácil (2) Fácil (3) Normal (4) Difícil (5) Impossível"
    puts "Escolha: "
    #Poderia deixar a próxima linha como a última e o programa entenderia que eu quero retornar o valor na variável "dificuldade"
    dificuldade = gets.to_i
    return dificuldade
end

def sorteia_numero_secreto (dificuldade)
    case dificuldade
    when 1
        maximo = 30
    when 2
        maximo = 60
    when 3
        maximo = 100
    when 4
        maximo = 150
    else
        maximo = 200
    end

    puts "Escolhendo um número secreto entre 1 e #{maximo}..."
    # Soma o "+ 1" para que seja possível acessar números entre 1 inclusivo e máximo inclusivo
    sorteado = rand(maximo) + 1
    puts "Escolhido...  que tal adivinhar hoje nosso número secreto?"
    return sorteado
end

def pede_um_numero(chutes, tentativa, limite_de_tentativas)
    puts "\n\n\n\n"
    puts "Tentativa #{tentativa} de #{limite_de_tentativas}"
    puts "Chutes até agora: #{chutes}"
    puts "Entre com o número"
    chute = gets.strip
    puts "Será que acertou? Você chutou #{chute}"
    return chute.to_i
end

def ganhou
    puts
    puts "             OOOOOOOOOOO               "
    puts "         OOOOOOOOOOOOOOOOOOO           "
    puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
    puts "    OOOOOO      OOOOO      OOOOOO      "
    puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
    puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
    puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
    puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
    puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
    puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
    puts "         OOOOOO         OOOOOO         "
    puts "             OOOOOOOOOOOO              "
    puts
    puts "               Acertou!                "
    puts
end

def verifica_se_acertou(numero_secreto, chute)
    acertou = numero_secreto == chute.to_i

    if acertou
        ganhou
        return true
    end
    
    maior = numero_secreto > chute.to_i
    if maior
        puts "O número secreto é maior."
    else
        puts "O número secreto é menor."
    end
    return false
end

def joga(nome, dificuldade)
    numero_secreto = sorteia_numero_secreto dificuldade

    pontos_ate_agora = 1000
    limite_de_tentativas = 5
    chutes = []
    
    for tentativa in 1..limite_de_tentativas
        chute = pede_um_numero(chutes, tentativa, limite_de_tentativas)
        chutes << chute
    
        if nome = "Dimitri"
            ganhou
            break
        end
    
        pontos_a_perder = (chute - numero_secreto).abs / 2.0
        pontos_ate_agora -= pontos_a_perder
    
        if verifica_se_acertou(numero_secreto, chute)
            break
        end
    end
    puts "Pontos: #{pontos_ate_agora} pontos."
end

def quer_jogar
    puts "Quer jogar novamente? (S/N)"
    quero_jogar = gets.strip
    quero_jogar.upcase == "S"
    # retorna "S" para a função
end

nome = da_boas_vindas
dificuldade = pede_dificuldade

loop do
    joga nome, dificuldade
    if !quer_jogar
        break
    end
end


# Esta é uma forma de escrever o "if" em uma linha, passando os parâmetros sem parênteses e quebrando o loop, caso o returno seja "TRUE", como no exemplo:
#
# break if verifica_se_acertou numero_secreto, chute
