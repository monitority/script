
PURPLE='0;35'
NC='\033[0m' 
VERSAO=11

echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7) Olá Cliente, serei seu assistente para instalação da nossa aplicação! $(tput setaf 2)(Aderval)"
sleep 2

echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7) Verificando aqui se você possui o Java e o Docker instalado... $(tput setaf 2)(Aderval)"

java -version
 if [ $? = 0 ]; #se retorno for igual a 0
    then #entao,
        echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7) Java instalado! Continuando com a configuração...$(tput setaf 2)(Aderval)"
        sleep 2
    else #se nao,
        echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7) Java não instalado! Prosseguindo com a instalação do JAVA... $(tput setaf 2)(Aderval)"
        sleep 2
        sudo apt install openjdk-17-jre -y #executa instalacao do java
        clear
sleep 2
docker --version
 if [ $? = 0 ]; #se retorno for igual a 0
    then #entao,
        echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7) Docker instalado! Continuando com a configuração...$(tput setaf 2)(Aderval)"
        sleep 2
    else #se nao,
        echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7) Docker não instalado! Prosseguindo com a instalação do Docker... $(tput setaf 2)(Aderval)"
        sleep 2
        sudo apt install docker.io -y #executa instalacao do docker
        sudo systemctl start docker
        sudo systemctl enable docker
        clear
        echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7) Instalando a imagem do MySql ... $(tput setaf 2)(Aderval)"
        sleep 2
        sudo docker pull mysql:5.7 #executa instalacao do mysql
        echo "Configurando O MySql..."
        clear
        echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7) Criando o Container com a imagem do MySql ... $(tput setaf 2)(Aderval)"
        sleep 2
        sudo docker run -d -p 3306:3306 --name ContainerBD -e "MYSQL_DATABASE=banco1" -e "MYSQL_ROOT_PASSWORD=urubu60" mysql:5.7
        clear
sleep 2
sudo apt upgrade && sudo apt update
clear
        echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7) Deseja pegar o arquivo .JAR do GitHub [s\n] $(tput setaf 2)(Aderval)"
        sleep 2           
read resp
if [ \"$resp\" == \"s\" ];
        then
        echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7)Qual versão deseja
        1 - GUI
        2 - CLI $(tput setaf 2)(Aderval)"
        sleep 2
                read resp
                if [ \"$resp\" == \"1\" ];
                    then
                    echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7) Clonando ... $(tput setaf 2)(Aderval)"
        sleep 2
                        wget https://raw.githubusercontent.com/monitority/JframeEC2/v2/jframe-monitority-1.0-SNAPSHOT-jar-with-dependencies.jar
                        echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7) Criando o Container com a imagem do MySql ... $(tput setaf 2)(Aderval)"
        sleep 2
        fi
        clear
        echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7)Deseja executar? [s\n]  $(tput setaf 2)(Aderval)"
        sleep 2
        read get
                            if [ \"$get\" == \"s\" ]
                                then 
                                  echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7) Executando ... $(tput setaf 2)(Aderval)"
                                    java -jar jframe-monitority-1.0-SNAPSHOT-jar-with-dependencies.jar
                            fi
                            else 
                              echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7) Finalizando ... $(tput setaf 2)(Aderval)"
                fi
                if [ \"$resp\" == \"2\" ];
                    then
                        echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7) Clonando ... $(tput setaf 2)(Aderval)"
        sleep 2
        clear
                        wget https://raw.githubusercontent.com/monitority/JframeEC2/v3/jframe-monitority-consolelog/target/jframe-monitority-consolelog-1.0-SNAPSHOT-jar-with-dependencies.jar

                       echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7)Deseja executar? [s\n]$(tput setaf 2)(Aderval)"
                        read get
        sleep 2 
                            if [ \"$get\" == \"s\" ]
                                then
                                 echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7) Executando... $(tput setaf 2)(Aderval)"
        sleep 2 
                                    java -jar jframe-monitority-consolelog-1.0-SNAPSHOT-jar-with-dependencies.jar
                            fi
                            else 
                            clear
                            echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7)Finalizando... $(tput setaf 2)(Aderval)"
        sleep 2
        clear
                fi
        else 
        echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7)Finalizando... $(tput setaf 2)(Aderval)"
        sleep 2
        clear
fi
