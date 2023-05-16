sudo apt upgrade && sudo apt update
clear

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
sudo apt update && sudo apt upgrade –y
clear

docker --version
if [ $? = 0 ]; #se retorno for igual a 0
    then #entao,
        echo “docker instalado” #print no terminal
    else #se nao,
        echo “docker não instalado” #print no terminal
        echo “gostaria de instalar o docker e ativar no seu sistema? [s/n]” #print no terminal
        read get #variável que guarda resposta do usuário
     if [ \“$get\” == \“s\” ]; #se retorno for igual a s
        then #entao
            sudo apt install docker.io #executa instalacao do docker
            sudo systemctl start docker
            sudo systemctl enable docker
    fi #fecha o 2º if
fi

echo "Deseja instalar a imagem do MySql?"
if [ \“$get\” == \“s\” ]; #se retorno for igual a s
        then #entao
            sudo docker pull mysql:5.7 #executa instalacao do mysql
                echo "Configurando O MySql..."
            sudo docker run -d -p 3306:3306 --name ContainerBD -e "MYSQL_DATABASE=banco1" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:5.7
    fi #fecha o 2º if
echo "Deseja pegar o arquivo .JAR do GitHub [s\n]"

read resp
if [ \"$resp\" == \"s\" ];
        then
            echo "Qual versão deseja\n
                1 - GUI\n
                2 - CLI\n"
                read resp
                if [ \"$resp\" == \"1\" ];
                    then
                        echo "Clonando..."
                        wget https://raw.githubusercontent.com/monitority/JframeEC2/v2/jframe-monitority-1.0-SNAPSHOT-jar-with-dependencies.jar
                        echo "Deseja executar? [s\n]"
                        read get
                            if [ \"$get\" == \"s\" ]
                                then 
                                    echo "Executando..."
                                    java -jar jframe-monitority-1.0-SNAPSHOT-jar-with-dependencies.jar
                            fi
                            else 
                            echo "Finalizando..."
                fi
                if [ \"$resp\" == \"2\" ];
                    then
                        echo "Clonando..."
                        wget https://raw.githubusercontent.com/monitority/JframeEC2/v2//jframe-monitority-consolelog-1.0-SNAPSHOT-jar-with-dependencies.jar
                        echo "Deseja executar? [s\n]"
                        read get
                            if [ \"$get\" == \"s\" ]
                                then 
                                    echo "Executando..."
                                    java -jar jframe-monitority-consolelog-1.0-SNAPSHOT-jar-with-dependencies.jar
                            fi
                            else 
                            echo "Finalizando..."
                fi
        else 
            echo "Finalizando..."
fi