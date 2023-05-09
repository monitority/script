sudo apt upgrade && sudo apt update

java -version #verifica versao atual do java

 if [ $? = 0 ]; #se retorno for igual a 0

    then #entao,

        echo “java instalado” #print no terminal

    else #se nao,

        echo “java não instalado” #print no terminal

        echo “gostaria de instalar o java? [s/n]” #print no terminal

        read get #variável que guarda resposta do usuário

     if [ \“$get\” == \“s\” ]; #se retorno for igual a s

        then #entao

             sudo apt install openjdk-17-jre -y #executa instalacao do java
    fi #fecha o 2º if

fi

echo "Deseja pegar o arquivo .JAR do GitHub [s\n]"

read resp

if [ \"$resp\" == \"s\" ];

        then

            echo "Clonando..."
            wget https://raw.githubusercontent.com/monitority/JframeEC2/main/jframe-monitority-1.0-SNAPSHOT-jar-with-dependencies.jar
            
            echo "Deseja executar? [s\n]"

            read get

            if [ a\"$get\" == \"s\" ]

                then 

                    echo "Executando..."
                    java -jar jframe-monitority-1.0-SNAPSHOT-jar-with-dependencies.jar
                    
            fi

        else 
            echo "Finalizando..."

fi
