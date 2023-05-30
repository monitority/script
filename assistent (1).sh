#!/bin/bash

#!/bin/bash

sql="
USE banco1;

-- Table Perfil
CREATE TABLE IF NOT EXISTS Perfil (
idPerfil INT NOT NULL,
nome VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL,
senha VARCHAR(255) NOT NULL,
cpf CHAR(14) NOT NULL,
perfilAdministrador INT NULL,
PRIMARY KEY (idPerfil),
CONSTRAINT fk_Perfil_Perfil1
FOREIGN KEY (perfilAdministrador)
REFERENCES Perfil (idPerfil));


-- Table MaquinaCorporativa
CREATE TABLE IF NOT EXISTS MaquinaCorporativa (
idMaquinaCorporativa INT NOT NULL auto_increment,
IP VARCHAR(255) NULL,
sistemaOperacional VARCHAR(255) NULL,
nomeMaquina VARCHAR(255) NULL,
fkPerfil INT NOT NULL,
PRIMARY KEY (idMaquinaCorporativa),
CONSTRAINT fk_MaquinaCorporativa_Perfil1
FOREIGN KEY (fkPerfil) REFERENCES Perfil (idPerfil));

-- Table RamDadosEstaticos
CREATE TABLE IF NOT EXISTS RamDadosEstaticos (
idRamdadosEstaticos INT NOT NULL,
riscoRAM INT NULL,
total BIGINT NULL,
PRIMARY KEY (idRamdadosEstaticos));

-- Table coletaRAM
CREATE TABLE IF NOT EXISTS ColetaRAM (
idRAM INT NOT NULL auto_increment,
usoAtual BIGINT NULL,
disponivel BIGINT NULL,
dataHora DATETIME NULL,
fkMaquina INT NOT NULL,
fkEstaticaRAM INT NOT NULL,
PRIMARY KEY (idRAM, fkEstaticaRAM),
CONSTRAINT fk_RAMMaquinaCorporativa_MaquinaCorporativa1
FOREIGN KEY (fkMaquina)
REFERENCES MaquinaCorporativa (idMaquinaCorporativa),
CONSTRAINT fk_coletaRAM_RamMaquinaCorporativa1
FOREIGN KEY (fkEstaticaRAM)
REFERENCES RamDadosEstaticos (idRamdadosEstaticos));

-- Table CpuDadosEstaticos
CREATE TABLE IF NOT EXISTS CpuDadosEstaticos (
idCpuDadosEstaticos INT NOT NULL,
riscoCPU INT NULL,
nomeProcessador VARCHAR(255) NULL,
PRIMARY KEY (idCpuDadosEstaticos));

-- Table ColetaCPU
CREATE TABLE ColetaCPU (
idCPU INT NOT NULL auto_increment,
usoAtual INT NULL,
dataHota DATETIME NULL,
fkMaquina INT NOT NULL,
fkEstaticaCPU INT NOT NULL,
PRIMARY KEY (idCPU, fkEstaticaCPU),
CONSTRAINT fk_CPUServidor_MaquinaCorporativa1
FOREIGN KEY (fkMaquina)
REFERENCES MaquinaCorporativa (idMaquinaCorporativa),
CONSTRAINT fk_ColetaCPU_CpuMaquinaCorporativa1
FOREIGN KEY (fkEstaticaCPU)
REFERENCES CpuDadosEstaticos (idCpuDadosEstaticos));

-- Table HdDadosEstaticos
CREATE TABLE HdDadosEstaticos (
idHdDadosEstaticos INT NOT NULL,
riscoHD INT NULL,
modelo VARCHAR(255) NULL,
tamanho BIGINT NULL,
PRIMARY KEY (idHdDadosEstaticos));

-- Table ColetaHD
CREATE TABLE ColetaHD (
idHD INT NOT NULL auto_increment,
disponivel BIGINT,
dataHora DATETIME NULL,
fkMaquina INT NOT NULL,
fkEstaticaHD INT NOT NULL,
PRIMARY KEY (idHD, fkEstaticaHD),
CONSTRAINT fk_HD_MaquinaCorporativa1
FOREIGN KEY (fkMaquina)
REFERENCES MaquinaCorporativa (idMaquinaCorporativa),
CONSTRAINT fk_ColetaHD_HdMaquinaCorporativa1
FOREIGN KEY (fkEstaticaHD)
REFERENCES HdDadosEstaticos (idHdDadosEstaticos));
"

PURPLE='0;35'
NC='\033[0m' 
VERSAO=11
	
echo  "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7) Olá! serei seu assistente para instalação!;"
sleep 2
echo "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7) Antes de mais nada atualizar sua máquina!;"
sleep 2 
sudo apt update -y && sudo apt upgrade -y
clear 
echo  "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7)  Verificando aqui se você possui o Java instalado...;"
sleep 2
java -version
if [ $? -eq 0 ]
	then
		echo "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7) : Olá! você já¡ tem o java instalado!!"
		sleep 2
	else
		echo "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7)  Opa! Não identifiquei nenhuma versão do Java instalado, mas sem problemas, irei resolver isso agora!"
		sleep 2
		echo "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7)  Confirme para mim se realmente deseja instalar o Java (Y/n)?"		
	read inst
	if [ \"$inst\" == \"Y\" ]
		then
			echo "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7)  Ok! Você escolheu instalar o Java ;D"
			sleep 2	
            echo "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7) Preparando para instalar a versão 17 do Java."
            sleep 2
            sudo apt install openjdk-17-jre -y
                clear
				echo "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7) Java instalado com sucesso!"
				sleep 1

		else 	
		echo "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7)  Você optou por não instalar o Java por enquanto, até a proxima então!"
		sleep 2
		clear
	fi
fi
clear

echo  "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7)  Verificando aqui se você possui o Docker instalado...;"
sleep 2
docker --version
if [ $? -eq 0 ]
	then
		echo "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7) : Olá! você já¡ tem o Docker instalado!!"
		sleep 2
	else
		echo "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7)  Opa! Não identifiquei nenhuma versão do Docker instalado, mas sem problemas, irei resolver isso agora!"
		sleep 2
		echo "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7)  Confirme para mim se realmente deseja instalar o Docker (Y/n)?"		
	read inst
	if [ \"$inst\" == \"Y\" ]
		then
			echo "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7)  Ok! Você escolheu instalar o Docker ;D"
			sleep 2	
            echo "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7) Preparando para instalar o Docker."
            sleep 2
            sudo apt install docker.io -y
                clear
				echo "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7) Docker instalado com sucesso!"
				sleep 2

		else 	
		echo "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7)  Você optou por não instalar o Docker por enquanto, até a proxima então!"
		sleep 2
		clear
	fi
fi
clear

echo  "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7) Agora estou iniciando o Docker!!"
sudo systemctl start docker
echo  "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7) Docker iniciado com sucesso!!"
sleep 3

echo  "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7) Vamos habilitar o serviço do Docker para ser iniciado junto ao sistema operacional"
sudo systemctl enable docker
echo  "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7) Docker habilitado!!"
sleep 3 
clear

echo  "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7) Vamos fazer o pull da imagem do MySQL 5.7"
sudo docker pull mysql:5.7
echo  "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7) Pull do MySQL feita com sucesso!!"
sleep 3 

echo  "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7) Vamos criar o container e configurar a aplicação do MySQL dentro do container"
sudo docker run -d -p 3306:3306 --name ContainerBD -e "MYSQL_DATABASE=banco1" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:5.7
echo  "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7) Criação e configuração feitas!!"
sleep 3
sudo docker start ContainerBD
echo  "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7) Foi feito o start do container que deseja acessar!!"
clear

echo  "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7) Acessando o container..."
sleep 10
sudo docker exec -it ContainerBD bash -c "mysql -u root -purubu100 <<< '$sql'"
sleep 2
clear

echo  "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7) Agora vou instalar o software no Desktop;"
sleep 2
cd Desktop
rm Tracking-Digital-Solution-Jar-Azure-Mysql -r
git clone https://github.com/Tracking-Digital-Solution/Tracking-Digital-Solution-Jar-Azure-Mysql.git
cd Tracking-Digital-Solution-Jar-Azure-Mysql/
echo  "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7) Software instalado com sucesso!;"
sleep 2
echo  "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7) Aguarde um momento...estamos entrando no software!;"
sleep 2
echo  "$(tput setaf 10)[Tracking Assistant]:$(tput setaf 7) Aguarde iniciando seu projeto!;"
java -jar Monitor.jar