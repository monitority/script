  sql="
USE banco1;

-- Table Dados
CREATE TABLE IF NOT EXISTS Dados (
   id int primary key auto_increment,
   dataInsercao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   processadorPorc Varchar(45),
   cpuhz Varchar(45),
   totalProcessos int,
   threadsCpu int,
   memoriaTotal Varchar(45),
   memoriaDisponivel Varchar(45),
   memoriaEmUso Varchar(45),
   TamanhoDisco Varchar(45),
   LeituraDisco Varchar(45),
   EscritaDisco Varchar(45),
   TempoTransferencia Varchar(45),
   NomeRede Varchar(45),
   Hostname Varchar(45),
   NomeDeDominio Varchar(45),
   memoriaPorc varchar(45));
"

PURPLE='0;35'
NC='\033[0m'
VERSAO=11

echo "$(tput setaf 6)[Monitor]:$(tput setaf 7) Olá Cliente, serei seu assistente para instalação da nossa aplicação! Vamos começar atualizando o SO $(tput setaf 2)(Aderval)"
sleep 2
sudo apt upgrade && sudo apt update
echo "$(tput setaf 6)[Monitor]:$(tput setaf 7) Verificando aqui se você possui o Java e o Docker instalados... $(tput setaf 2)(Aderval)"
sleep 2

java -version
if [ $? -eq 0 ]; then
    echo "$(tput setaf 6)[Monitor]:$(tput setaf 7) Java instalado! Continuando com a configuração...$(tput setaf 2)(Aderval)"
    sleep 2
else
    echo "$(tput setaf 6)[Monitor]:$(tput setaf 7) Java não instalado! Prosseguindo com a instalação do Java... $(tput setaf 2)(Aderval)"
    sleep 2
    sudo apt install openjdk-17-jre -y
    clear
    sleep 2
fi

docker --version
if [ $? -eq 0 ]; then
    echo "$(tput setaf 6)[Monitor]:$(tput setaf 7) Docker instalado! Continuando com a configuração...$(tput setaf 2)(Aderval)"
    sleep 2
else
    echo "$(tput setaf 6)[Monitor]:$(tput setaf 7) Docker não instalado! Prosseguindo com a instalação do Docker... $(tput setaf 2)(Aderval)"
    sleep 2
    sudo apt install docker.io -y
    echo "$(tput setaf 10)[Monitor]:$(tput setaf 7) Docker instalado com sucesso! $(tput setaf 2)(Aderval)"
    sleep 2
    echo "$(tput setaf 6)[Monitor]:$(tput setaf 7) Instalando a imagem do MySql ... $(tput setaf 2)(Aderval)"
    sleep 2
    sudo docker pull mysql:5.7
    echo "Configurando o MySql..."
    clear
    echo "$(tput setaf 6)[Monitor]:$(tput setaf 7) Criando o Container com a imagem do MySql ... $(tput setaf 2)(Aderval)"
    sleep 2
    sudo docker run -d -p 3306:3306 --name ContainerBD2 -e "MYSQL_DATABASE=banco1" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:5.7
    clear
    sudo docker start ContainerBD2
    echo "$(tput setaf 6)[Monitor]:$(tput setaf 7) Criando rede de Conexão ... $(tput setaf 2)(Aderval)"
    sudo docker network create RedeContainer
    sleep 2
    clear
    echo "$(tput setaf 6)[Monitor]:$(tput setaf 7) Adicionando o Container a rede ... $(tput setaf 2)(Aderval)"
    sudo docker network connect RedeContainer ContainerBD2
    sleep 2
    clear
    echo "$(tput setaf 6)[Monitor]:$(tput setaf 7) Criando a tabela Dados no MySql ... $(tput setaf 2)(Aderval)"
    sleep 18
    sudo docker exec -it ContainerBD2 bash -c "mysql -u root -purubu100 <<< '$sql'"
    sleep 2
fi

clear
echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7) Deseja pegar o arquivo .JAR do GitHub [s/n] $(tput setaf 2)(Aderval)"
sleep 2
read resp
if [ "$resp" == "s" ]; then
    echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7) Qual versão deseja?
1 - GUI
2 - CLI $(tput setaf 2)(Aderval)"
    sleep 2
    read resp
    if [ "$resp" == "1" ]; then
        echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7) Clonando ... $(tput setaf 2)(Aderval)"
        sleep 2
        wget https://raw.githubusercontent.com/monitority/Jframe/main/jframe-monitority/target/jframe-monitority-1.0-SNAPSHOT-jar-with-dependencies.jar
        echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7) Verificando as Dependências ... $(tput setaf 2)(Aderval)"
        sleep 2
    fi
    clear
    echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7) Deseja executar? [s/n]  $(tput setaf 2)(Aderval)"
    sleep 2
    read get
    if [ "$get" == "s" ]; then
        echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7) Executando ... $(tput setaf 2)(Aderval)"
        java -jar jframe-monitority-1.0-SNAPSHOT-jar-with-dependencies.jar
    else
        echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7) Finalizando ... $(tput setaf 2)(Aderval)"
    fi
    if [ "$resp" == "2" ]; then
        echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7) Clonando ... $(tput setaf 2)(Aderval)"
        sleep 2
        clear
        git clone https://github.com/monitority/Jframe.git
        echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7) Acessando a pasta para criar a imagem ... $(tput setaf 2)(Aderval)"
        cd Jframe/jframe-monitority-consolelog
        sleep 2
        clear
        echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7) Criando a imagem ... $(tput setaf 2)(Aderval)"
        sudo docker build -t monitority .
        clear
        echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7) Deseja executar? [s/n] $(tput setaf 2)(Aderval)"
        read get
        sleep 2
        if [ "$get" == "s" ]; then
            echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7) Executando... $(tput setaf 2)(Aderval)"
            sudo docker run --name ContainerJava -it --network RedeContainer -p 8080:8080 monitority
        fi
    else
        clear
        echo  "$(tput setaf 6)[Monitor]:$(tput setaf 7) Finalizando... $(tput setaf 2)(Aderval)"
        sleep 2
        clear
    fi
fi
